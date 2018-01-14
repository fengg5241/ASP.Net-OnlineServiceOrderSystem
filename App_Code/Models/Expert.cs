using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;

namespace Models
{
    /// <summary>
    /// Summary description for Expert
    /// </summary>
    public class Expert
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        private int expId;
        private string expUserName;
        private string expFName;
        private string expLName;
        private string expEmail;
        private string expAddress;
        private string expHp;
        private string expGender;
        private string expPassword;
        string date;
        string time;
        private string expDOB;
        private string expStatus;


        public Expert()
        {

        }

        public Expert(int expId, string expUserName, string expFName, string expLName, string expEmail, string expPassword, string expAddress, string expHp, string expGender, string expDOB)
        {
            this.expId = expId;
            this.expUserName = expUserName;
            this.expFName = expFName;
            this.expLName = expLName;
            this.expEmail = expEmail;
            this.expPassword = expPassword;
            this.expAddress = expAddress;
            this.expHp = expHp;
            this.expGender = expGender;
            this.expDOB = expDOB;

        }

        public Expert(string expUserName, string expFName, string expLName, string expEmail, string expPassword, string expAddress, string expHp, string expGender)
        {
            this.expUserName = expUserName;
            this.expFName = expFName;
            this.expLName = expLName;
            this.expEmail = expEmail;
            this.expPassword = expPassword;
            this.expAddress = expAddress;
            this.expHp = expHp;
            this.expGender = expGender;
        }


        public Expert(int expId, string expUserName, string expFName, string expLName, string expEmail, string expPassword, string expAddress, string expHp, string expGender)
        {
            this.expId = expId;
            this.expUserName = expUserName;
            this.expFName = expFName;
            this.expLName = expLName;
            this.expEmail = expEmail;
            this.expPassword = expPassword;
            this.expAddress = expAddress;
            this.expHp = expHp;
            this.expGender = expGender;
        }

        public Expert(string expEmail)
        {
            this.expEmail = expEmail;
        }

        public Expert(string expUserName, string expFName, string expLName, string expEmail, string expAddress, string expHp, string expGender)
        {
            this.expUserName = expUserName;
            this.expFName = expFName;
            this.expLName = expLName;
            this.expEmail = expEmail;
            this.expAddress = expAddress;
            this.expHp = expHp;
            this.expGender = expGender;
        }
        public Expert(string expUserName, string expFName, string expLName, string expAddress, string expHp, string expGender)
        {
            this.expUserName = expUserName;
            this.expFName = expFName;
            this.expLName = expLName;
            this.expAddress = expAddress;
            this.expHp = expHp;
            this.expGender = expGender;
        }
        public Expert(int expId, string expUserName, string expFName, string expLName, string expEmail, string expAddress, string expHp, string expGender, string expDOB, string expPassword, string expStatus)
        {
            this.expId = expId;
            this.expUserName = expUserName;
            this.expFName = expFName;
            this.expLName = expLName;
            this.expEmail = expEmail;
            this.expAddress = expAddress;
            this.expHp = expHp;
            this.expGender = expGender;
            this.expDOB = expDOB;
            this.expPassword = expPassword;
            this.expStatus = expStatus;
        }

        public Expert(string expUserName, string expFName, string expLName, string expEmail, string expAddress, string expHp, string expDOB, string expGender, string expPassword)
        {
            this.expUserName = expUserName;
            this.expFName = expFName;
            this.expLName = expLName;
            this.expEmail = expEmail;
            this.expAddress = expAddress;
            this.expHp = expHp;
            this.expDOB = expDOB;
            this.expGender = expGender;
            this.expPassword = expPassword;
        }

        public Expert(string date, string time)
        {
            this.date = date;
            this.time = time;
        }

        //-----------------------------------------------------------------------------------------------------//
        public int ExpId
        {
            get
            {
                return expId;
            }

            set
            {
                expId = value;
            }
        }

        public string ExpFName
        {
            get
            {
                return expFName;
            }

            set
            {
                expFName = value;
            }
        }

        public string ExpLName
        {
            get
            {
                return expLName;
            }

            set
            {
                expLName = value;
            }
        }

        public string ExpEmail
        {
            get
            {
                return expEmail;
            }

            set
            {
                expEmail = value;
            }
        }

        public string ExpPassword
        {
            get
            {
                return expPassword;
            }

            set
            {
                expPassword = value;
            }
        }

        public string ExpHp
        {
            get
            {
                return expHp;
            }

            set
            {
                expHp = value;
            }
        }

        public string ExpGender
        {
            get
            {
                return expGender;
            }

            set
            {
                expGender = value;
            }
        }

        public string ExpUserName
        {
            get
            {
                return expUserName;
            }

            set
            {
                expUserName = value;
            }
        }

        public string ExpAddress
        {
            get
            {
                return expAddress;
            }

            set
            {
                expAddress = value;
            }
        }

        public string ExpStatus
        {
            get
            {
                return expStatus;
            }

            set
            {
                expStatus = value;
            }
        }

        public string ExpDOB
        {
            get
            {
                return expDOB;
            }

            set
            {
                expDOB = value;
            }
        }

        public string Date
        {
            get
            {
                return date;
            }

            set
            {
                date = value;
            }
        }

        public string Time
        {
            get
            {
                return time;
            }

            set
            {
                time = value;
            }
        }


        //-----------------------------------------------------------------------------------------------------//
        public Expert getExpert(int id)
        {
            Expert expDetail = null;
            string expFName, expLName, expPassword, expEmail, expAddress, expGender, expHp;

            string queryStr = "SELECT * FROM Expert WHERE Id = @Id";
            SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@Id", id);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            //Check if there are any resultsets
            if (dr.Read())
            {
                expUserName = dr["UserName"].ToString();
                expFName = dr["FirstName"].ToString();
                expLName = dr["LastName"].ToString();
                expPassword = dr["Password"].ToString();
                expEmail = dr["Email"].ToString();
                expAddress = dr["Address"].ToString();
                expHp = dr["PhoneNumber"].ToString();
                expGender = dr["Gender"].ToString();
                //   expDay = dr["DateOfBirth"].ToString();
                //    expMonth = dr["DateOfBirth"].ToString();
                //    expYear = dr["DateOfBirth"].ToString();

                expDetail = new Expert(expId, expUserName, expFName, expLName, expEmail, expPassword, expAddress, expHp, expGender);
            }
            else
            {
                expDetail = null;
            }
            conn.Close();
            dr.Close();
            dr.Dispose();
            return expDetail;
        }
        //-----------------------------------------------------------------------------------------------------//
        public Expert getExpert(string email)
        {
            Expert expDetail = null;

            string expUserName, expFName, expLName, expGender, expHp, expAddress;

            string queryStr = "SELECT * FROM Expert WHERE Email = @Email";
            SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@Email", email);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            //Check if there are any resultsets
            if (dr.Read())
            {
                expUserName = dr["UserName"].ToString();
                expFName = dr["FirstName"].ToString();
                expLName = dr["LastName"].ToString();
                expAddress = dr["Address"].ToString();
                //  userDateOfBirth = dr["DateOfBirth"].ToString();
                expGender = dr["Gender"].ToString();
                expHp = dr["PhoneNumber"].ToString();
                expDetail = new Expert(expUserName, expFName, expLName, expAddress, expHp, expGender);
            }
            else
            {
                expDetail = null;
            }
            conn.Close();
            dr.Close();
            dr.Dispose();
            return expDetail;
        }

        //-----------------------------------------------------------------------------------------------------//
        public List<Expert> getExpertAll()
        {
            List<Expert> expList = new List<Expert>();
            int expId;
            string expUserName, expFName, expLName, expEmail, expPassword, expHp, expGender, expAddress;

            string queryStr = "SELECT * FROM Expert Order By Id";
            SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            //Continue to read the resultsets row by row if not the end
            while (dr.Read())
            {
                expId = int.Parse(dr["Id"].ToString());
                expUserName = dr["UserName"].ToString();
                expFName = dr["FirstName"].ToString();
                expLName = dr["LastName"].ToString();
                expEmail = dr["Email"].ToString();
                expPassword = dr["Password"].ToString();
                expAddress = dr["Address"].ToString();
                expHp = dr["PhoneNumber"].ToString();
                expGender = dr["Gender"].ToString();
                //   expDay = dr["DateOfBirth"].ToString();
                //  expMonth = dr["DateOfBirth"].ToString();
                //  expYear = dr["DateOfBirth"].ToString();

                Expert a = new Expert(expId, expUserName, expFName, expLName, expEmail, expPassword, expAddress, expHp, expGender);
                expList.Add(a);
            }
            conn.Close();
            dr.Close();
            dr.Dispose();
            return expList;
        }
        //-----------------------------------------------------------------------------------------------------//
        public int ExpertInsert()
        {
            int result = 0;
            string queryStr = "INSERT INTO Expert(UserName, FirstName, LastName, Password, Email, Address, PhoneNumber, Gender)"
     + "values (@UserName, @FirstName, @LastName, @Password, @Email, @Address, @PhoneNumber, @Gender)";

            SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            // cmd.Parameters.AddWithValue("@ExpId", this.expId);
            cmd.Parameters.AddWithValue("@UserName", this.expUserName);
            cmd.Parameters.AddWithValue("@FirstName", this.expFName);
            cmd.Parameters.AddWithValue("@LastName", this.expLName);
            cmd.Parameters.AddWithValue("@Password", this.expPassword);
            cmd.Parameters.AddWithValue("@Email", this.expEmail);
            // cmd.Parameters.AddWithValue("@DateOfBirth", this.expDOB);
            cmd.Parameters.AddWithValue("@Address", this.expAddress);
            cmd.Parameters.AddWithValue("@PhoneNumber", this.expHp);
            cmd.Parameters.AddWithValue("@Gender", this.expGender);
            //  cmd.Parameters.AddWithValue("@Status", this.expStatus);
            //cmd.Parameters.AddWithValue("@DateOfBirth", this.expDay);
            // cmd.Parameters.AddWithValue("@DateOfBirth", this.expMonth);
            //cmd.Parameters.AddWithValue("@DateOfBirth", this.expYear);
            conn.Open();
            result += cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
            conn.Close();
            return result;
        }//end Insert
         //-----------------------------------------------------------------------------------------------------//
        public int ExpertMeetingInsert()
        {
            int result = 0;
            string queryStr = "INSERT INTO Expert(MeetingDate, MeetingTime)"
     + "values (@MeetingDate, @MeetingTime)";

            SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            // cmd.Parameters.AddWithValue("@ExpId", this.expId);
            cmd.Parameters.AddWithValue("@MeetingDate", this.expUserName);
            cmd.Parameters.AddWithValue("@MeetingTime", this.expFName);

            //  cmd.Parameters.AddWithValue("@Status", this.expStatus);
            //cmd.Parameters.AddWithValue("@DateOfBirth", this.expDay);
            // cmd.Parameters.AddWithValue("@DateOfBirth", this.expMonth);
            //cmd.Parameters.AddWithValue("@DateOfBirth", this.expYear);
            conn.Open();
            result += cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
            conn.Close();
            return result;
        }//end Insert
         //-----------------------------------------------------------------------------------------------------//
        public int ExpertDelete(string ID)
        {
            string queryStr = "DELETE FROM Expert WHERE Id=@ID";
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
        public int ExpertUpdate(int expId, string expUserName, string expFName, string expLName, string expPassword, string expEmail, string expHp, string expAddress, string expGender)
        {
            string queryStr = "UPDATE Expert SET" +
            " UserName = @UserName, " +
            " FirstName = @FirstName, " +
            " LastName = @LastName, " +
            " Email = @Email, " +
            " Password = @Password, " +
            " PhoneNumber = @PhoneNumber, " +
            " Address = @Address, " +
            " Gender = @Gender" +
            " WHERE Id = @Id";
            SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@Id", expId);
            cmd.Parameters.AddWithValue("@UserName", expUserName);
            cmd.Parameters.AddWithValue("@FirstName", expFName);
            cmd.Parameters.AddWithValue("@LastName", expLName);
            cmd.Parameters.AddWithValue("@Email", expEmail);
            cmd.Parameters.AddWithValue("@Password", expPassword);
            cmd.Parameters.AddWithValue("@PhoneNumber", expHp);
            cmd.Parameters.AddWithValue("@Address", expAddress);
            cmd.Parameters.AddWithValue("@Gender", expGender);
            conn.Open();
            int nofRow = 0;
            nofRow = cmd.ExecuteNonQuery();
            conn.Close();
            return nofRow;
        }//end Update
    }
}