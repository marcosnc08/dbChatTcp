using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class chat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];

        string connection = "Data Source=.\\SQL2008R2;Initial Catalog=dbChat;User ID=sa;Password=1234";
        string query = "SELECT idMensaje, Login, IdSala, FechaHora, Texto FROM Mensaje WHERE IdSala=@idSala";
        string query2 = "SELECT DISTINCT Login FROM Mensaje WHERE IdSala=@idSala";
        
        SqlConnection conn = new SqlConnection(connection);
        conn.Open();
        SqlCommand command = new SqlCommand(query, conn);
        command.Parameters.AddWithValue("@idSala", id);

        SqlCommand command2 = new SqlCommand(query2, conn);
        command2.Parameters.AddWithValue("@idSala", id);
        
        SqlDataAdapter adtp = new SqlDataAdapter(command);
        DataTable dtMensajes = new DataTable();

        SqlDataAdapter adtp2 = new SqlDataAdapter(command2);
        DataTable dtUsuarios = new DataTable();

        adtp.Fill(dtMensajes);
        adtp2.Fill(dtUsuarios);

        conn.Close();

        lvMensajes.DataSource = dtMensajes;
        lvMensajes.DataBind();

        lvUsuarios.DataSource = dtUsuarios;
        lvUsuarios.DataBind();
    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        string connection = "Data Source=.\\SQL2008R2;Initial Catalog=dbChat;User ID=sa;Password=1234";
        SqlConnection conn = new SqlConnection(connection);

        conn.Open();
        string query = "INSERT INTO Mensaje (Login, idSala, FechaHora, Texto) Values (@login, @id, @fecha, @texto)";

        SqlCommand commandLog = new SqlCommand(query, conn);
        commandLog.Parameters.AddWithValue("@login", ((usuario)Session["conectado"]).login);
        commandLog.Parameters.AddWithValue("@id", Request.QueryString["id"]);
        commandLog.Parameters.AddWithValue("@fecha", DateTime.Now);
        commandLog.Parameters.AddWithValue("@texto", txtMensaje.Text);

        commandLog.ExecuteNonQuery();

    }
}