using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for usuario
/// </summary>
public class usuario
{
    private string pvLogin;
    private string pvPassword;
    private DateTime pvUltimoAcceso;
    private bool pvAdministrador;

    public string login
    {
        set
        {
            pvLogin = value;
        }
        get
        {
            return pvLogin;
        }
    }


    public string password
    {
        set
        {
            pvPassword = value;
        }
        get
        {
            return pvPassword;
        }
    }

    public DateTime ultimoAcceso
    {
        set
        {
            pvUltimoAcceso = value;
        }
        get
        {
            return pvUltimoAcceso;
        }
    }

    public bool administrador
    {
        set
        {
            pvAdministrador = value;
        }
        get
        {
            return pvAdministrador;
        }
    }
}