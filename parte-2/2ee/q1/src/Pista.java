public class Pista {
    private boolean ocupada = false;

    public boolean taOcupada() {
        return this.ocupada;
    }

    public void ocupar() {
        this.ocupada = true;
    }

    public void desocupar() {
        this.ocupada = false;
    }
}