using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Models
{
    /// <summary>
    /// Summary description for User
    /// </summary>
    public class User
    {
        private string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        private int userId;
        private string userName;
        private string userFName;
        private string userLName;
        private string userHp;
        private string userGender;
        private string userDateOfBirth;
        private string userEmail;
        private string userPassword;
        private string userAddress;
        private string userPostalCode;



        public User()
        {

        }


        public User(int userId, string userName, string userFName, string userLName, string userEmail, string userHp, string userGender)
        {
            this.UserId = userId;
            this.UserName = userName;
            this.UserFName = userFName;
            this.UserLName = userLName;
            this.UserEmail = userEmail;

            this.UserHp = userHp;
            this.UserGender = userGender;


        }

        public User(int userId, string userName, string userFName, string userLName, string userEmail, string userPassword, string userHp, string userGender, string userDateOfBirth)
        {
            this.userId = userId;
            this.UserName = userName;
            this.userFName = userFName;
            this.userLName = userLName;
            this.userEmail = userEmail;
            this.userPassword = userPassword;
            this.userHp = userHp;
            this.userGender = userGender;
            this.userDateOfBirth = userDateOfBirth;
        }

        public User(string userName, string userFName, string userLName, string userEmail, string userPassword, string userDateOfBirth, string userHp, string userGender)
        {
            this.userName = userName;
            this.userFName = userFName;
            this.userLName = userLName;
            this.userEmail = userEmail;
            this.userPassword = userPassword;
            this.userHp = userHp;
            this.userGender = userGender;
            this.userDateOfBirth = userDateOfBirth;
        }
        public User(string userName, string userFName, string userLName, string userEmail, string userPassword, string userHp, string userGender)
        {
            this.userName = userName;
            this.userFName = userFName;
            this.userLName = userLName;
            this.userEmail = userEmail;
            this.userPassword = userPassword;
            this.userHp = userHp;
            this.userGender = userGender;

        }

        public User(int userId, string userName, string userFName, string userLName, string userEmail, string userPassword, string userHp, string userGender)
        {
            this.userId = userId;
            this.userName = userName;
            this.userFName = userFName;
            this.userLName = userLName;
            this.userEmail = userEmail;
            this.userPassword = userPassword;
            this.userHp = userHp;
            this.userGender = userGender;
        }

        public User(string userName, string userFName, string userLName, string userHp, string userGender)
        {
            this.userName = userName;
            this.userFName = userFName;
            this.userLName = userLName;
            this.userHp = userHp;
            this.userGender = userGender;
        }

        public User(string userName, string userFName, string userLName, string userHp, string userGender, string userDateOfBirth, string userEmail, string userPassword, string userAddress, string userPostalCode)
        {
            this.userName = userName;
            this.userFName = userFName;
            this.userLName = userLName;
            this.userHp = userHp;
            this.userGender = userGender;
            this.userDateOfBirth = userDateOfBirth;
            this.userEmail = userEmail;
            this.userPassword = userPassword;
            this.userAddress = userAddress;
            this.userPostalCode = userPostalCode;
        }

        public User(string userName, string userFName, string userLName, string userHp, string userGender, string userDateOfBirth, string userEmail, string userPassword, string userAddress)
        {
            this.userName = userName;
            this.userFName = userFName;
            this.userLName = userLName;
            this.userHp = userHp;
            this.userGender = userGender;
            this.userDateOfBirth = userDateOfBirth;
            this.userEmail = userEmail;
            this.userPassword = userPassword;
            this.userAddress = userAddress;
        }

        public User(string userName, string userFName, string userLName, string userHp, string userGender, string userDateOfBirth)
        {
            this.userName = userName;
            this.userFName = userFName;
            this.userLName = userLName;
            this.userHp = userHp;
            this.userGender = userGender;
            this.userDateOfBirth = userDateOfBirth;
        }

        public int UserId
        {
            get
            {
                return userId;
            }

            set
            {
                userId = value;
            }
        }

        public string UserFName
        {
            get
            {
                return userFName;
            }

            set
            {
                userFName = value;
            }
        }

        public string UserLName
        {
            get
            {
                return userLName;
            }

            set
            {
                userLName = value;
            }
        }

        public string UserEmail
        {
            get
            {
                return userEmail;
            }

            set
            {
                userEmail = value;
            }
        }

        public string UserPassword
        {
            get
            {
                return userPassword;
            }

            set
            {
                userPassword = value;
            }
        }

        public string UserHp
        {
            get
            {
                return userHp;
            }

            set
            {
                userHp = value;
            }
        }

        public string UserGender
        {
            get
            {
                return userGender;
            }

            set
            {
                userGender = value;
            }
        }

        public string UserDateOfBirth
        {
            get
            {
                return userDateOfBirth;
            }

            set
            {
                userDateOfBirth = value;
            }
        }

        public string UserName
        {
            get
            {
                return userName;
            }

            set
            {
                userName = value;
            }
        }

        public User getUser(int id)
        {
            User userDetail = null;

            string userName, userFName, userLName, userPassword, userDateOfBirth, userGender, userHp;

            string queryStr = "SELECT * FROM [User] WHERE Id = @Id";
            SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@Id", id);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            //Check if there are any resultsets
            if (dr.Read())
            {
                userName = dr["UserName"].ToString();
                userFName = dr["FirstName"].ToString();
                userLName = dr["LastName"].ToString();
                userDateOfBirth = dr["DateOfBirth"].ToString();
                userGender = dr["Gender"].ToString();
                userPassword = dr["Password"].ToString();
                userEmail = dr["Email"].ToString();
                userHp = dr["PhoneNumber"].ToString();
                userDetail = new User(userName, userFName, userLName, userEmail, userPassword, userHp, userGender, userDateOfBirth);
            }
            else
            {
                userDetail = null;
            }
            conn.Close();
            dr.Close();
            dr.Dispose();
            return userDetail;
        }

        public User getUser(string email)
        {
            User userDetail = null;

            string userName, userFName, userLName, userGender, userHp, userDateOfBirth;

            string queryStr = "SELECT * FROM [User] WHERE Email = @Email";
            SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@Email", email);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            //Check if there are any resultsets
            if (dr.Read())
            {
                userName = dr["UserName"].ToString();
                userFName = dr["FirstName"].ToString();
                userLName = dr["LastName"].ToString();
                //  userDateOfBirth = dr["DateOfBirth"].ToString();
                userGender = dr["Gender"].ToString();
                userHp = dr["PhoneNumber"].ToString();
                userDateOfBirth = dr["DateOfBirth"].ToString();
                userDetail = new User(userName, userFName, userLName, userHp, userGender, userDateOfBirth);
                userDetail.UserId = Convert.ToInt32(dr["Id"]);
            }
            else
            {
                userDetail = null;
            }
            conn.Close();
            dr.Close();
            dr.Dispose();
            return userDetail;
        }

        public List<User> getUserAll()
        {
            List<User> userList = new List<User>();
            int userId;
            string userFName, userLName, userEmail, userPassword, userHp, userGender, userDateOfBirth;

            string queryStr = "SELECT * FROM [User] Order By Email";
            SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                userId = int.Parse(dr["Id"].ToString());
                userName = dr["UserName"].ToString();
                userFName = dr["FirstName"].ToString();
                userLName = dr["LastName"].ToString();
                userEmail = dr["Email"].ToString();
                userPassword = dr["Password"].ToString();
                userHp = dr["PhoneNumber"].ToString();
                userGender = dr["Gender"].ToString();
                userDateOfBirth = dr["DateOfBirth"].ToString();



                User a = new User(userId, userName, userFName, userLName, userEmail, userPassword, userHp, userGender, userDateOfBirth);
                userList.Add(a);
            }
            conn.Close();
            dr.Close();
            dr.Dispose();
            return userList;
        }

        public int UserInsert()
        {

            int result = 0;
            string queryStr = "INSERT INTO [User](UserName, FirstName, LastName, Password, Email, DateOfBirth, PhoneNumber, Gender, Enabled)"
     + "values (@UserName, @FirstName, @LastName, @Password, @Email, @DateOfBirth, @PhoneNumber, @Gender, 1)";

            SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            //  cmd.Parameters.AddWithValue("@Id", this.UserId);
            cmd.Parameters.AddWithValue("@UserName", this.userName);
            cmd.Parameters.AddWithValue("@FirstName", this.userFName);
            cmd.Parameters.AddWithValue("@LastName", this.userLName);
            cmd.Parameters.AddWithValue("@Password", this.userPassword);
            cmd.Parameters.AddWithValue("@Email", this.userEmail);
            cmd.Parameters.AddWithValue("@DateOfBirth", this.userDateOfBirth);
            // cmd.Parameters.AddWithValue("@Address", this.userAddress);
            // cmd.Parameters.AddWithValue("@PostalCode", this.userPostalCode);
            cmd.Parameters.AddWithValue("@PhoneNumber", this.userHp);
            cmd.Parameters.AddWithValue("@Gender", this.userGender);

            conn.Open();
            result += cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
            conn.Close();
            return result;
        }//end Insert

        public int UserDelete(string ID)
        {
            string queryStr = "DELETE FROM [User] WHERE Id=@ID";
            SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@Id", ID);
            conn.Open();
            int nofRow = 0;
            nofRow = cmd.ExecuteNonQuery();
            conn.Close();
            return nofRow;
        }//end Delete
         //-----------------------------------------------------------------------------------------------------//

        public int UserUpdate(int userId, string userName, string userFName, string userLName, string userEmail, string userPassword, string userHp, string userGender)
        {
            string queryStr = "UPDATE [User] SET" +
            " UserName = @UserName, " +
            " FirstName = @FirstName, " +
            " LastName = @LastName, " +
            " Email = @Email, " +
            " Password = @Password, " +
            " PhoneNumber = @PhoneNumber, " +
            " Gender = @Gender" +
            " WHERE Id = @Id";
            SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@Id", userId);
            cmd.Parameters.AddWithValue("@UserName", userName);
            cmd.Parameters.AddWithValue("@FirstName", userFName);
            cmd.Parameters.AddWithValue("@LastName", userLName);
            cmd.Parameters.AddWithValue("@Email", userEmail);
            cmd.Parameters.AddWithValue("@Password", userPassword);
            cmd.Parameters.AddWithValue("@PhoneNumber", userHp);
            cmd.Parameters.AddWithValue("@Gender", userGender);
            conn.Open();
            int nofRow = 0;
            nofRow = cmd.ExecuteNonQuery();
            conn.Close();
            return nofRow;
        }//end Update


        public int UserUpdate(string userName, string userFName, string userLName, string userEmail, string userHp, string userGender)
        {

            string queryStr = "UPDATE [User] SET" +
            " UserName = @UserName, " +
            " FirstName = @FirstName, " +
            " LastName = @LastName, " +
            " PhoneNumber = @PhoneNumber, " +
            " Gender = @Gender" +
            " WHERE Email = @Email";
            SqlConnection conn = new SqlConnection(DbHelper.ConnectionString)
            ; SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@UserName", userName);
            cmd.Parameters.AddWithValue("@FirstName", userFName);
            cmd.Parameters.AddWithValue("@LastName", userLName);
            cmd.Parameters.AddWithValue("@Email", userEmail);
            cmd.Parameters.AddWithValue("@PhoneNumber", userHp);
            cmd.Parameters.AddWithValue("@Gender", userGender);
            conn.Open();
            int nofRow = 0;
            nofRow = cmd.ExecuteNonQuery();
            conn.Close();
            return nofRow;
        }//end Update
    }
}