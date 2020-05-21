using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for DbAccess
/// </summary>
public class DbAccess
{
    public static bool SaveData(string qry1)
    {
        string conn_str = ConfigurationManager.ConnectionStrings["dbcs"].ToString();
        using (SqlConnection con = new SqlConnection(conn_str))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(qry1, con);
            cmd.ExecuteNonQuery();
            return true;
        }
    }
    public static DataSet FetchData(string qry2)
    {
        string conn_str = ConfigurationManager.ConnectionStrings["dbcs"].ToString();
        using (SqlConnection con = new SqlConnection(conn_str)) 
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(qry2, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

    }

	
}