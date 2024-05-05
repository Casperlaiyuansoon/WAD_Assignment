using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Drawing;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace WAD_Assignment
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string fromEmail = "laiys-wm21@student.tarc.edu.my"; // Replace with your email
            string toEmail = "fejin12@gmail.com"; // Replace with recipient email
            string subject = "Contact Form Submission";
            string body = $"Name: {txtName.Text}\n";
            body += $"Email: {txtEmail.Text}\n";
            body += $"Message: {txtMessage.Text}";



            try
            {
                using (var message = new MailMessage(fromEmail, toEmail))
                {
                    message.Subject = subject;
                    message.Body = body;

                    using (var smtpClient = new SmtpClient("smtp.gmail.com")) // Replace with your SMTP server
                    {
                        smtpClient.Credentials = new NetworkCredential("laiys-wm21@student.tarc.edu.my", "000523080231"); // Replace with your SMTP credentials
                        smtpClient.Port = 587; // Replace with the SMTP port
                        smtpClient.EnableSsl = true; // Enable SSL if required

                        smtpClient.Send(message);
                    }
                }

                Response.Write("Your message has been sent successfully!");
                ClearFields();
            }
            catch (Exception ex)
            {
                Response.Write($"Error: {ex.Message}");
            }



        }

        private void ClearFields()
        {
            txtName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtMessage.Text = string.Empty;
        }


    }
}