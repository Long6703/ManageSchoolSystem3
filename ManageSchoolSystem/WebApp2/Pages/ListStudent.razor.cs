﻿using AntDesign;
using gPRCContracts;
using Microsoft.AspNetCore.Components;
using OneOf.Types;
using Share.EditModel;
using Share.ViewModel;

namespace WebApp2.Pages
{

    public partial class ListStudent
    {
        List<UserViewModel> list = new List<UserViewModel>();
        UserViewModel userview = new UserViewModel();
        public Searching<UserViewModel> searchComponent;
        static int pageSize = 6;
        static int pageIndex = 1;
        static int totalstudent;
        string receivedMessage = "";
        List<int> listClassidSelected = new List<int>();
        bool visible = false;
        bool visibleCreate = false;

        void openCreate()
        {
            this.visibleCreate = true;
        }
        void open(UserViewModel userview2)
        {
            this.visible = true;
            userview = userview2;
        }
        protected override async Task OnInitializedAsync()
        {
            await LoadData(pageIndex, "", listClassidSelected);
        }
        private async Task LoadData(int pageindex, string searchitem, List<int> listselectedclass)
        {
            try
            {
                GetUserResponseForWebApp response = await UserService.GetAllStudentForPageAsync(new GetUserRequestForWebApp
                {
                    offset = (pageindex - 1) * pageSize,
                    count = pageSize,
                    searchString = searchitem,
                    classID = listselectedclass
                });
                list = _mapper.Map<List<UserViewModel>>(response.UserInfo);
                int startIndex = (pageindex - 1) * pageSize + 1;
                foreach (var user in list)
                {
                    user.Index = startIndex++;
                }
                totalstudent = response.Total;
                pageIndex = pageindex;
                StateHasChanged();
            }
            catch (Exception ex)
            {
                await Console.Out.WriteLineAsync(ex.Message);
            }
        }

        public async Task DeleteStudent(UserViewModel userview)
        {
            await UserService.DeleteStudentAsync(new DeleteStudentRequest { UserID = userview.UserID });
            await LoadData(pageIndex, searchComponent.searchTerm, listClassidSelected);
        }

        public async Task AfterStudentCreated()
        {
            await LoadData(pageIndex, searchComponent.searchTerm, listClassidSelected);
            this.visibleCreate = false;
            this.visible = false;
        }

        protected async Task HandleSearchResults()
        {
            await LoadData(1, searchComponent.searchTerm, listClassidSelected);
            StateHasChanged();
        }

        private async Task HandleCheckboxChanged(Dictionary<int, bool> selectedClasses)
        {
            listClassidSelected.Clear();
            foreach (var item in selectedClasses)
            {
                if (item.Value == true)
                {
                    listClassidSelected.Add(item.Key);
                }
            }
            await LoadData(1, searchComponent.searchTerm, listClassidSelected);
            StateHasChanged();
        }

        async Task GoToPageAsync(PaginationEventArgs e)
        {
            pageIndex = e.Page;
            await LoadData(pageIndex, searchComponent.searchTerm, listClassidSelected);
        }

        private async Task ReceiveMessage(string message)
        {
            receivedMessage = message;
            if (receivedMessage.Contains("failed"))
            {
                _message.Error(receivedMessage);
            }else
            {
                _message.Success(receivedMessage);
            }
            await LoadData(pageIndex, searchComponent.searchTerm, listClassidSelected);
        }
    }
}
