import java.util.concurrent.locks.*;
import static java.lang.Thread.sleep;

public class Aeroporto {
    private Pista[] pistas;
    private Lock lock = new ReentrantLock();
    private Condition pistasArrayLiberado = lock.newCondition();

    public Aeroporto(Pista[] pistas) {
        this.pistas = pistas;
    }

    public int encontrarPistaLivreIndex() {
        for (int i=0; i<this.pistas.length; i++) {
            if (!this.pistas[i].taOcupada()) {
                return i;
            }
        }
        return -1;
    }

    public long ocuparPista(Aviao aviao) throws InterruptedException {
        int pistaIndex = -1;

        lock.lock();
        try {
            pistaIndex = encontrarPistaLivreIndex();

            while (pistaIndex == -1) {
                pistasArrayLiberado.await();
                pistaIndex = encontrarPistaLivreIndex();
            }

            this.pistas[pistaIndex].ocupar();
            String atividadeString = (aviao.getAtividade() == 0) ? "decolar" : "aterrissar";
            System.out.println("• " + aviao.getId() + " irá "+atividadeString+" na pista " + pistaIndex + "!");
            pistasArrayLiberado.signalAll();
        } finally {
            lock.unlock();
        }

        desocuparPista(aviao, pistaIndex);
        return pistaIndex;
    }

    public void desocuparPista(Aviao aviao, int pistaIndex) throws InterruptedException {
        lock.lock();

        try {
            sleep(500);
            pistasArrayLiberado.await();
            this.pistas[pistaIndex].desocupar();
            long timeMillisDesocuparPista = System.currentTimeMillis();

            System.out.println("✈️ " +aviao.getId()+" desocupou a pista "+pistaIndex+" [Planejado: "+aviao.getHorarioPlanejado()+ " | Real: "+timeMillisDesocuparPista+" | Atraso: "+(timeMillisDesocuparPista- aviao.getHorarioPlanejado())+"]");
            pistasArrayLiberado.signalAll();
        } finally {
            lock.unlock();
        }
    }
}
