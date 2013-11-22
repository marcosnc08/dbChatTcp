using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class salaDeEspera : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connection = "Data Source=.\\SQL2008R2;Initial Catalog=dbChat;User ID=sa;Password=1234";
        string query = "SELECT idSala, Descripcion FROM Sala";
        
        SqlConnection conn = new SqlConnection(connection);
        SqlDataAdapter adtp = new SqlDataAdapter(query, conn);
        
        DataTable dt_salas = new DataTable();
        adtp.Fill(dt_salas);

        gvSalas.DataSource = dt_salas;
        gvSalas.DataBind();
    }
    protected void gvSalas_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        usuario currentUser = (usuario)Session["conectado"];
        GridViewRow gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
        Label id = (Label)gvr.FindControl("lblIdSala");
        if (e.CommandName == "Entrar")
        {
            Response.Redirect("Chat.aspx?id=" + id.Text);
        }
        else
        {
            if (e.CommandName == "BorrarSala" && currentUser.administrador == true)
            {
                string connection = "Data Source=.\\SQL2008R2;Initial Catalog=dbChat;User ID=sa;Password=1234";
                string query = "DELETE FROM [dbChat].[dbo].[Mensaje] WHERE idSala=@idSala";
                string query2 = "DELETE FROM [dbChat].[dbo].[Sala] WHERE idSala=@idSala";


                SqlConnection conn = new SqlConnection(connection);
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@idSala", id.Text);
                SqlCommand cmd2 = new SqlCommand(query2, conn);
                cmd2.Parameters.AddWithValue("@idSala", id.Text);
                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    cmd2.ExecuteNonQuery();
                }
                catch (Exception)
                {
                    lblErrores.Text = "Se produjo un error al intentar borrar la sala";
                }
                finally
                {
                    conn.Close();
                }
            }
            else
            {
                lblErrores.Text = "Debe ser administrador para borrar una sala";
            }
        }
    }
    protected void btnCrearSala_Click(object sender, EventArgs e)
    {
        usuario currenUser = (usuario)Session["conectado"];

        if (currenUser.administrador == true)
        {
            string connection = "Data Source=.\\SQL2008R2;Initial Catalog=dbChat;User ID=sa;Password=1234";
            string query = "INSERT INTO Sala (Descripcion) VALUES (@desc)";

            SqlConnection conn = new SqlConnection(connection);
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@desc", txtNuevaSalaNombre.Text);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                lblErrores.Text = "Error al crear nueva sala";
            }
            finally
            {
                conn.Close();
            }
        }
        else
        {
            lblErrores.Text = "Debe ser administrador para crear una sala";
        }
       
    }
}