using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using static iTextSharp.text.pdf.PdfDocument;

public partial class Index : System.Web.UI.Page
{
    Message ms = new Message();
    DataSet ds = new DataSet();
    DataSet dts = new DataSet();
    string role;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        if (txtUserName.Text == "Admin" || txtUserName.Text == "admin" || txtUserName.Text == "ADMIN")
        {
            ds = ms.admin(txtUserName.Text, txtPassword.Text);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["admin"] = txtUserName.Text;
                Response.Redirect("Admin/Dashboard.aspx");
            }
            else
            {
                td_message.InnerText = "Please Check your credentials";
            }
        }
        else if (txtUserName.Text != "Admin" || txtUserName.Text != "admin" || txtUserName.Text != "ADMIN")
        {
            DataSet dsStatus = ms.emp_login(txtUserName.Text, txtPassword.Text);
            if (dsStatus.Tables[0].Rows.Count > 0)
            {
                DataTable dt = new DataTable();
                dt = BL.dtt1("SELECT tbl2.Status, tbl2.CompanyName FROM Add_employees tbl1 join tbl_CompanyDetails tbl2 on tbl2.CompId=tbl1.comp_name where tbl1.emp_id='" + txtUserName.Text + "'");
                if (dt.Rows[0]["Status"].ToString() == "true")
                {
                    DataTable dtStatus = dsStatus.Tables[0];

                    if (dtStatus.Rows.Count > 0)
                    {
                        string status = dtStatus.Rows[0]["status"].ToString();

                        if (status == "Active")
                        {
                            Session["Employee"] = txtUserName.Text;
                            Response.Redirect("Employee/Dashbord.aspx");
                        }

                        else
                        {
                            td_message.InnerText = "Your account is not active. Please contact Admin Department.";
                        }
                    }
                    else
                    {
                        td_message.InnerText = "Please check your credentials.";
                    }


                }

                else
                {
                    td_message.InnerHtml = "Please Contact with Company !!";
                }
            }
            else
            {
                td_message.InnerHtml = "Invalid Credentials!! Check your User id and Password and try Again";
            }
        }
    }
}