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
        //if (Session["conectado"] == null)
            //Response.Redirect("login.aspx");

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
        if(e.CommandName=="Entrar")
        {
            GridViewRow gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            string idSala = Convert.ToString(gvr.RowIndex);

            Response.Redirect("Chat.aspx?id=" + idSala);
        }
    }
}