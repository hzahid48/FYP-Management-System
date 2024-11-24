using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

public class User
{
    public int UserId { get; set; }  // Primary Key

    [Required]  // This field is mandatory
    [StringLength(50)]  // Maximum length of 50 characters
    public string Username { get; set; }

    [Required]  // This field is mandatory
    [StringLength(255)]  // Store hashed passwords with sufficient length
    public string PasswordHash { get; set; }

    [Required]  // This field is mandatory
    [StringLength(50)]
    public string Role { get; set; }  // e.g., Student, Supervisor, Panel Member

    [Required]  // This field is mandatory
    [StringLength(50)]
    public string FirstName { get; set; }

    [Required]  // This field is mandatory
    [StringLength(50)]
    public string LastName { get; set; }

    [Required]  // This field is mandatory
    [EmailAddress]  // Validate proper email format
    public string Email { get; set; }
}
