
package modelo;
//constructor por defecto
public class Membresias {
    Integer codigo;
    String nombre;
    String descripcion;
    String descuentos;

    public Membresias() {
    }

    public Membresias(Integer codigo, String nombre, String descripcion, String descuentos) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.descuentos = descuentos;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDescuentos() {
        return descuentos;
    }

    public void setDescuentos(String descuentos) {
        this.descuentos = descuentos;
    }

   
    
    
    
    
}
