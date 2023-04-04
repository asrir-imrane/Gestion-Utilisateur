using System;
using System.Security.Cryptography;
using System.Text;

namespace User_Manage.Services
{
    public static class PasswordHasher
    {
        public static string HashPassword(string password)
        {
            // Generate a random salt
            byte[] saltBytes = new byte[16];
            using (var rng = new RNGCryptoServiceProvider())
            {
                rng.GetBytes(saltBytes);
            }
            string salt = Convert.ToBase64String(saltBytes);

            // Hash the password with the salt using PBKDF2
            byte[] hashBytes = new Rfc2898DeriveBytes(password, saltBytes, 10000).GetBytes(32);
            string hash = Convert.ToBase64String(hashBytes);

            // Combine the salt and hash into a single string and return it
            return $"{salt}:{hash}";
        }

        public static bool VerifyPassword(string password, string passwordHash)
        {
            // Extract the salt and hash from the stored password hash
            string[] parts = passwordHash.Split(':');
            if (parts.Length != 2)
            {
                return false;
            }
            string salt = parts[0];
            string hash = parts[1];

            // Hash the password with the stored salt using PBKDF2
            byte[] saltBytes = Convert.FromBase64String(salt);
            byte[] hashBytes = new Rfc2898DeriveBytes(password, saltBytes, 10000).GetBytes(32);
            string newHash = Convert.ToBase64String(hashBytes);

            // Compare the new hash to the stored hash and return the result
            return newHash == hash;
        }
    }
}