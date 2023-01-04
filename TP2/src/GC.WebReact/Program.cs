using GC.BL;
using GC.DAL.EF;
using GC.DAL.EF.Models;
using GC.Entites;
using Microsoft.AspNetCore.Authentication;
using Microsoft.EntityFrameworkCore;


namespace GC.WebReact
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            var connectionString = builder.Configuration.GetConnectionString("DefaultConnection") ?? throw new InvalidOperationException("Connection string 'DefaultConnection' not found.");
            builder.Services.AddDbContext<ApplicationDbContext>(options =>
                options.UseSqlServer(connectionString, b => b.MigrationsAssembly("GC.WebReact")));
            builder.Services.AddDatabaseDeveloperPageExceptionFilter();

            builder.Services.AddDefaultIdentity<ApplicationUser>(options => options.SignIn.RequireConfirmedAccount = true)
                .AddEntityFrameworkStores<ApplicationDbContext>();

            // PFL : https://github.com/dotnet/core/blob/main/release-notes/6.0/known-issues.md#spa-template-issues-with-individual-authentication-when-running-in-development
            builder.Services.AddIdentityServer(options =>
            {
                string issuerUri = builder.Configuration.GetValue<string>("IdentityServer:IssuerUri");
                if (!string.IsNullOrEmpty(issuerUri))
                {
                    options.IssuerUri = issuerUri;
                }
            })
                .AddApiAuthorization<ApplicationUser, ApplicationDbContext>();

            builder.Services.AddAuthentication()
                .AddIdentityServerJwt();

            builder.Services.AddControllersWithViews();
            builder.Services.AddRazorPages();

            builder.Services.AddScoped<IDepotClients, DepotClientsEF>();
            builder.Services.AddScoped<GestionClientsBL>();

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseMigrationsEndPoint();
            }
            else
            {
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseRouting();

            app.UseAuthentication();
            app.UseIdentityServer();
            app.UseAuthorization();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller}/{action=Index}/{id?}");
            app.MapRazorPages();

            app.MapFallbackToFile("index.html");

            app.Run();
        }
    }
}