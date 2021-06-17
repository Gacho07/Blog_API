using Application.Commands.Email;
using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace Implementation.Commands.Email
{
    public class SMTPEmailSender : IEmailSender
    {
        public void Send(SendEmailDto dto)
        {
            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential("blogapiii@gmail.com", "blogapi2021")
            };

            var message = new MailMessage("blogapiii@gmail.com", dto.SendTo);
            message.Subject = dto.Subject;
            message.Body = dto.Content;
            message.IsBodyHtml = true;
            smtp.Send(message);
        }
    }
}
