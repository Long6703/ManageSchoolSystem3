﻿using ProtoBuf.Grpc;
using Repository.IRepo;
using Repository.RepoImplement;
using Share.gPRCContracts;
using Share.ViewModel;
using AutoMapper;
using Share.Model;

namespace GrpcService.Services
{
    public class UserService : IUserService
    {
        private readonly IUserRepo _userRepo;
        private readonly IMapper _mapper;

        public UserService(IUserRepo userRepo, IMapper mapper)
        {
            _userRepo = userRepo;
            _mapper = mapper;
        }

        public Task<CreateUserResponse> CreateStudentAsync(CreateUserRequest request, CallContext context = default)
        {
            bool result = _userRepo.CreateStudent(request.useredit);
            if(result == true)
            {
                return Task.FromResult(new CreateUserResponse
                {
                    Message = "Create student success"
                });
            }
            return Task.FromResult(new CreateUserResponse
            {
                Message = "Create student failed"
            });
        }

        public Task<DeleteStudentResponse> DeleteStudentAsync(DeleteStudentRequest request, CallContext context = default)
        {
            bool check = _userRepo.DeleteStudent(request.UserID);
            if(check == true)
            {
                return Task.FromResult(new DeleteStudentResponse
                {
                    Message = "Delete student success"
                });
            }
            return Task.FromResult(new DeleteStudentResponse
            {
                Message = "Delete student failed"
            });
        }

        public Task<EditUserResponse> EditStudentAsync(EditUserRequest request, CallContext context = default)
        {
            User user = _userRepo.GetStudentById(request.id);
            if(user == null)
            {
                return Task.FromResult(new EditUserResponse
                {
                    Message = "Student not found"
                });
            }
            _userRepo.EditStudent(request.id, request.UserInfor);
            return Task.FromResult(new EditUserResponse
            {
                Message = "Edit student success"
            });

        }

        public Task<GetUserResponse> GetAllStudentAsync(GetUserRequest request, CallContext context = default)
        {
            var users = _userRepo.GetAllStudent();
            return Task.FromResult(new GetUserResponse
            {
                UserInfo = users
            });
        }

        public Task<GetUserResponse2> GetAllStudentForPageAsync(GetUserRequest2 request, CallContext context = default)
        {
            var (users, total) = _userRepo.GetAllStudentForPagging(request.offset, request.count, request.searchString, request.classID);
            return Task.FromResult(new GetUserResponse2
            {
                UserInfo = users,
                Total = total
            });
        }

        public Task<GetClassResponse2> GetClassAsync(GetClassRequest2 request, CallContext context = default)
        {
            var classes = _userRepo.GetClassses();
            return Task.FromResult(new GetClassResponse2
            {
                AllClasss = classes
            });
        }

        public Task<GetStudentByIDResponse> GetStudentByIDAsync(GetStudentByIDRequest request, CallContext context = default)
        {
            var user = _userRepo.GetStudentById(request.UserID);
            if(user == null)
            {
                return Task.FromResult(new GetStudentByIDResponse
                {
                    UserViewInfo = null
                });
            }
            var userViewModel = _mapper.Map<UserViewModel> (user);
            return Task.FromResult(new GetStudentByIDResponse
            {
                UserViewInfo = userViewModel
            });
        }
    }
}
