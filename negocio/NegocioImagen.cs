using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class NegocioImagen
    {
        public List<Imagen> Listar(int id)
        {
            List<Imagen> lista = new List<Imagen>();
            AccesoDatos datos = new AccesoDatos();
           
            try
            {
                datos.setearConsulta("SELECT G.ID,G.IDARTICULO,G.IMAGENURL AS IMAGEN from IMAGENES G, ARTICULOS A WHERE G.IDARTICULO=A.ID AND A.ID=@id");
                datos.setearParametro("@id", id);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Imagen imagen = new Imagen();
                    imagen.Id = datos.Lector.GetInt32(0);
                    imagen.Url = (string)datos.Lector["IMAGEN"];
                    imagen.IdArticulo = datos.Lector.GetInt32(1);
                  
                    lista.Add(imagen);
                }

            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }

            return lista;
        }
    }
}
