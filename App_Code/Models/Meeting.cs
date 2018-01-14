using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
namespace Models
{
    /// <summary>
    /// Summary description for Meeting
    /// </summary>
    public class Meeting
    {
        private string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        int id;
        string date;
        string time;

        public Meeting()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public Meeting(int id, string date, string time)
        {
            this.id = id;
            this.date = date;
            this.time = time;
        }

        public Meeting(string date, string time)
        {
            this.date = date;
            this.time = time;
        }

        public int Id
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
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

        public int MeetingInsert()
        {

            int result = 0;
            string queryStr = "INSERT INTO MeetingSchedule(MeetingDate, MeetingTime)"
     + "values (@MeetingDate, @MeetingTime)";

            SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            //  cmd.Parameters.AddWithValue("@Id", this.UserId);
            cmd.Parameters.AddWithValue("@MeetingDate", this.date);
            cmd.Parameters.AddWithValue("@MeetingTime", this.time);


            conn.Open();
            result += cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
            conn.Close();
            return result;
        }//end Insert
    }
}