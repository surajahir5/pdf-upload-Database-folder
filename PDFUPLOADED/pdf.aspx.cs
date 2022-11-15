using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PDFUPLOADED
{
    public partial class pdf : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-7SNQED0\SQLEXPRESS;Initial Catalog=suraj;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            Label2.Visible = true;
            string filePath = FileUpload1.PostedFile.FileName;
            string filename1 = Path.GetFileName(filePath);
            FileUpload1.SaveAs(Request.PhysicalApplicationPath + "/file/" + FileUpload1.FileName.ToString());
            string ext = Path.GetExtension(filename1);
            string type = String.Empty;
            if (!FileUpload1.HasFile)
            {
                Label2.Text = "Please Select File";
            }
            else
            if (FileUpload1.HasFile)
            {

                try
                {
                    switch (ext)
                    {
                        case ".pdf":
                            type = ".pdf";
                            break;
                        case ".doc":
                            type = ".doc";
                            break;
                        case ".docx":
                            type = ".docx";
                            break;
                    }
                    if (type != String.Empty && ext == ".pdf" || ext == ".docx" || ext == ".doc")
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("insert into uploadpdff values(@name,@type)", con);
                        cmd.Parameters.Add("@name", SqlDbType.VarChar).Value =filename1;        
                        cmd.Parameters.Add("@type", SqlDbType.VarChar).Value = type;
                        cmd.ExecuteNonQuery();
                        Label2.ForeColor = System.Drawing.Color.Green;
                        Label2.Text = "File Uploaded Successfully";
                    }
                    else
                    {
                        Label2.ForeColor = System.Drawing.Color.Red;
                        Label2.Text = "Select Only PDF Files ";
                    }
                }
                catch (Exception ex)
                {
                    Label2.Text = "Error: " + ex.Message.ToString();
                }
            }
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from uploadpdff", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select name,type from uploadpdff where id=@id", con);
            cmd.Parameters.AddWithValue("id", GridView1.SelectedRow.Cells[1].Text);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Response.Clear();
                Response.Buffer = true;
                Response.ContentType = dr["type"].ToString();
                Response.AddHeader("content-disposition", "attachment;filename=" + dr["name"].ToString());
                Response.Charset = "";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.End();
            }
        }

    }
}
