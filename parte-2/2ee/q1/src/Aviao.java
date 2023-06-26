public class Aviao implements Runnable {
    private String id;
    private int atividade;
    private long horarioPlanejado;
    private int prioridade;
    private Aeroporto aeroporto;

    public Aviao(String id, int atividade, long horarioPlanejado) {
        this.id = id;
        this.atividade = atividade;
        this.horarioPlanejado = horarioPlanejado;
    }

    public String getId() {
        return this.id;
    }

    public long getAtividade() {
        return this.atividade;
    }

    public long getHorarioPlanejado() {
        return this.horarioPlanejado;
    }

    public int getPrioridade() {
        return this.prioridade;
    }

    public void setPrioridade(int prioridade) {
        this.prioridade = prioridade;
    }

    public void setAeroporto(Aeroporto aeroporto) {
        this.aeroporto = aeroporto;
    }

    public void run() {
        while (true) {
            // System.out.println(this.id + " - - " + this.prioridade);

            if (System.currentTimeMillis() >= this.horarioPlanejado) {
                long pistaIndex = 0;
                try {
                    pistaIndex = this.aeroporto.ocuparPista(this);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }

                break;
            }
        }
    }
}