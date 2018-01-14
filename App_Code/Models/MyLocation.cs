using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Models
{
    /// <summary>
    /// Summary description for MyLocation
    /// </summary>
    public class MyLocation
    {
        private string connstr = ConfigurationManager.ConnectionStrings["ConnectionStringr"].ConnectionString;
        private string region;
        private string city;
        public MyLocation()
        {

        }
        public string Region
        {
            get
            {
                return region;
            }

            set
            {
                region = value;
            }
        }

        public string City
        {
            get
            {
                return city;
            }

            set
            {
                city = value;
            }
        }

        public MyLocation(string region, string city)
        {
            this.region = region;
            this.city = city;
        }

        public int MyLocationInsert()
        {

            int result = 0;
            string queryStr = "INSERT INTO Location(Region, City)"
     + "values (@Region, @City)";

            SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            //  cmd.Parameters.AddWithValue("@Id", this.UserId);
            cmd.Parameters.AddWithValue("@Region", this.region);
            cmd.Parameters.AddWithValue("@City", this.city);


            conn.Open();
            result += cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
            conn.Close();
            return result;
        }//end Insert


    }

}