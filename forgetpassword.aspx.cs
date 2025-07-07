using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class forgetpassword : System.Web.UI.Page
{
    string phoneNumber;
    string EmpId;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            OtpField.Visible = false;
            SubmitOtp.Visible = false;
        }
    }

    protected void SendEmpIdAndOtp_method(object sender, EventArgs e)
    {
        OtpField.Visible = true;

        DataTable dt2 = new DataTable();
        dt2 = BL.dtt("SELECT phone,emp_id FROM Add_employees where  emp_id ='" + txtEmpId.Text + "'");
        if (dt2.Rows.Count > 0)
        {
            phoneNumber = dt2.Rows[0]["phone"].ToString();
            EmpId = dt2.Rows[0]["emp_id"].ToString();
           
        }

        if (string.IsNullOrEmpty(EmpId))
        {
            // Show error message if phone number is empty
            ErrorMessage.Text = "Please enter a valid Employee Id.";
            return;
        }
        // Check if phone number is valid (optional step)
        if (string.IsNullOrEmpty(phoneNumber))
        {
            // Show error message if phone number is empty
            ErrorMessage.Text = "Please enter a valid phone number.";
            return;
        }

        // Generate a random OTP (example OTP length 6)
        string otp = GenerateOtp();
        SendOtp(phoneNumber, otp);
    }
    private string MaskPhoneNumber(string phoneNumber)
    {
        if (phoneNumber.Length < 10)
        {
            return phoneNumber; // Return as is
        }

        string maskedNumber = "XXXXXX" + phoneNumber.Substring(phoneNumber.Length - 4);
        return maskedNumber;
    }
    private void SendOtp(string phoneNumber, string otp)
    {
        Session["OTP"] = otp;
        string maskedPhoneNumber = MaskPhoneNumber(phoneNumber);
        try
        {
            // Prepare the URL with the necessary query parameters
            string url = $"https://waap.pt1.in/http-tokenkeyapi.php?authentic-key=34337068756c61723130301740559269&route=1&number={phoneNumber}&message=Your OTP is: {otp}";
        
            // Create a new HttpClient instance
            using (HttpClient client = new HttpClient())
            {
                // Send the GET request
                HttpResponseMessage response = client.GetAsync(url).Result;

                // Check if the response is successful
                if (response.IsSuccessStatusCode)
                {
                    SuccessMessage.Text = "OTP sent successfully! On Your Mobile"+" "+ maskedPhoneNumber;
                    SubmitOtp.Visible = true;
                    ResetPassWord.Visible = false;
                }
                else
                {
                    // Handle failure response (Optional: Display failure message)
                    ErrorMessage.Text = "Failed to send OTP.";
                }
            }
        }
        catch (Exception ex)
        {
            // Handle exceptions (e.g., network issues)
            ErrorMessage.Text = $"Error: {ex.Message}";
        }
    }

    private string GenerateOtp()
    {
        Random random = new Random();
        string otp = random.Next(100000, 999999).ToString();
        return otp;
    }
    protected void SubmitOtp_method(object sender, EventArgs e)
    {
        string enteredOtp = txtOTP.Text;
        string generatedOtp = Session["OTP"] as string;

        if (generatedOtp == null)
        {
            ErrorMessage.Text = "OTP session expired. Please request a new OTP.";
            return;
        }
        if (enteredOtp == generatedOtp)
        {
            SuccessMessage.Text = "OTP validated successfully! Proceed with the next step.";

            Session["Employee"] = txtEmpId.Text;
            Response.Redirect("Employee/Dashbord.aspx");
        }
        else
        {
            // OTP is incorrect, show error
            ErrorMessage.Text = "Invalid OTP. Please try again.";
        }
    }
}