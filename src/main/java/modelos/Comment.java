package modelos;

public class Comment {
    private int id;
    private String titulo;
    private String comentario;
    private int calificacion;
    private int id_product;

    public Comment() {
    }

    public Comment(int id, String titulo, String comentario, int calificacion, int id_product) {
        this.id = id;
        this.titulo = titulo;
        this.comentario = comentario;
        this.calificacion = calificacion;
        this.id_product = id_product;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public int getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(int calificacion) {
        this.calificacion = calificacion;
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }
}
