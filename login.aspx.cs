using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["conectado"] != null)
            Response.Redirect("salaDeEspera.aspx");
    }
    protected void btnLog_Click(object sender, EventArgs e)
    {
        string connection = "Data Source=.\\SQL2008R2;Initial Catalog=dbChat;User ID=sa;Password=1234";
        SqlConnection conn = new SqlConnection(connection);

        conn.Open();
        string queryLog = "SELECT Login, Password, UltimoAcceso, Administrador FROM Usuario WHERE Login=@login and Password=@pass";

        SqlCommand commandLog = new SqlCommand(queryLog, conn);
        commandLog.Parameters.AddWithValue("@login", txtUsuario.Text);
        commandLog.Parameters.AddWithValue("@pass", txtContra.Text);

        SqlDataReader reader = commandLog.ExecuteReader();

        if (reader.HasRows)
        {
            usuario userLogin = new usuario();
            reader.Read();
            userLogin.login = reader["Login"].ToString();
            userLogin.password = reader["Password"].ToString();
            userLogin.administrador = (bool)reader["Administrador"];

            conn.Close();
            userLogin.ultimoAcceso = DateTime.Now;

            conn.Open();
            queryLog = "UPDATE usuario SET UltimoAcceso=@UltimoAcceso WHERE login=@login AND Password=@pass";
            commandLog = new SqlCommand(queryLog, conn);
            commandLog.Parameters.AddWithValue("@login", txtUsuario.Text);
            commandLog.Parameters.AddWithValue("@pass", txtContra.Text);
            commandLog.Parameters.AddWithValue("@UltimoAcceso", userLogin.ultimoAcceso);
            commandLog.ExecuteNonQuery();

            Session["conectado"] = userLogin;
            Response.Redirect("salaDeEspera.aspx");
        }
        else
        {
            lblLog.Text = "Los datos ingresados no son correctos.";
        }

        conn.Close();

    }
    protected void btnRegistro_Click(object sender, EventArgs e)
    {
        string connection = "Data Source=.\\SQL2008R2;Initial Catalog=dbChat;User ID=sa;Password=1234";
        SqlConnection conn = new SqlConnection(connection);

        try
        {
            conn.Open();
            string queryReg = "SELECT Login FROM Usuario WHERE Login=@login";

            SqlCommand commandReg = new SqlCommand(queryReg, conn);
            commandReg.Parameters.AddWithValue("@login", txtUsuarioRegistro.Text);

           
            SqlDataReader reader = commandReg.ExecuteReader();
            if (reader.HasRows)
            {
                lblLogRegistro.Text = "El usuario ya existe !";
            }
            else
            {
                conn.Close();
                string queryRegistro = "INSERT INTO [dbChat].[dbo].[Usuario] (Login, Password, UltimoAcceso, Administrador) VALUES (@login, @pass, @ultimoAcceso, @admin)";

                SqlCommand command = new SqlCommand(queryRegistro, conn);
                command.Parameters.AddWithValue("@login", txtUsuarioRegistro.Text);
                command.Parameters.AddWithValue("@pass", txtContraRegistro.Text);
                command.Parameters.AddWithValue("@ultimoAcceso", DateTime.Now);
                command.Parameters.AddWithValue("@admin", false);

                conn.Open();
                command.ExecuteNonQuery();
                lblLogRegistro.Text = "Se registro al usuario correctamente.";
            }
        }
        catch (Exception)
        {
            lblLogRegistro.Text = "Se produjo un error al intentar registrar al usuario.";
        }
        finally
        {
            conn.Close();
        }      
    }
}