using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
namespace Models
{
    /// <summary>
    /// Summary description for ExpertName
    /// </summary>
    public class ExpertServiceType
    {
        private string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        int id;
        string Name;
        string Description;

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

        public string _Name
        {
            get
            {
                return Name;
            }

            set
            {
                Name = value;
            }
        }

        public string _Description
        {
            get
            {
                return Description;
            }

            set
            {
                Description = value;
            }
        }

        public ExpertServiceType()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public ExpertServiceType(int id, string Name, string Description)
        {
            this.id = id;
            this.Name = Name;
            this.Description = Description;
        }

        public ExpertServiceType(string Name, string Description)
        {
            this.Name = Name;
            this.Description = Description;
        }

        public int ServiceInsert()
        {

            int result = 0;
            string queryStr = "INSERT INTO ServiceType(Name,Description)"
     + "values (@ServiceName, @NameDescription)";

            SqlConnection conn = new SqlConnection(DbHelper.ConnectionString);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            //  cmd.Parameters.AddWithValue("@Id", this.UserId);
            cmd.Parameters.AddWithValue("@ServiceName", this.Name);
            cmd.Parameters.AddWithValue("@NameDescription", this.Description);


            conn.Open();
            result += cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
            conn.Close();
            return result;
        }//end Insert
    }
}