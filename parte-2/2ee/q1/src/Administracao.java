import java.util.*;

/*
    Aline Gouveia (amtg)
    II Exercício Escolar - PLC (Q1)
*/

public class Administracao {
    public static void main(String[] args) {
        long timeMillisInicioPrograma = System.currentTimeMillis();
        Scanner entrada = new Scanner(System.in);

        System.out.println("Digite quantos aviões estão para sair (N)");
        int N = entrada.nextInt();
        Aviao[] avioesSaida = new Aviao[N];

        System.out.println("Digite, para cada avião, sua hora de saída");
        for (int i=0; i<N; i++) {
            System.out.print("N-"+i+ ": ");
            long horarioPlanejado = entrada.nextLong();
            avioesSaida[i] = new Aviao("N-" + Integer.toString(i), 0, timeMillisInicioPrograma + horarioPlanejado);
        }

        System.out.println("Digite quantos aviões estão para chegar (M)");
        int M = entrada.nextInt();
        Aviao[] avioesChegada = new Aviao[M];

        System.out.println("Digite, para cada avião, sua hora de chegada");
        for (int i=0; i<M; i++) {
            System.out.print("M-"+i+ ": ");
            long horarioPlanejado = entrada.nextLong();
            avioesChegada[i] = new Aviao("M-" + Integer.toString(i), 1, timeMillisInicioPrograma + horarioPlanejado);
        }

        Aviao[] avioes = new Aviao[N + M];
        System.arraycopy(avioesSaida, 0, avioes, 0, N);
        System.arraycopy(avioesChegada, 0, avioes, N, M);
        System.arraycopy(avioesChegada, 0, avioes, N, M);
        Arrays.sort(avioes, new Comparator<Aviao>() {
            public int compare(Aviao a1, Aviao a2) {
                return Long.compare(a1.getHorarioPlanejado(), a2.getHorarioPlanejado());
            }
        });

        System.out.println("Digite o número de pistas a serem consideradas neste aeroporto (K)");
        int K = entrada.nextInt();
        Pista[] pistas = new Pista[K];
        for (int i=0; i< pistas.length; i++) {
            pistas[i] = new Pista();
        }

        System.out.println("⋆｡˚ ☁︎ ˚｡⋆｡˚☽˚｡⋆ ⋆｡˚ ☁︎ ˚｡⋆｡˚☽˚｡⋆ ⋆｡˚ ☁︎ ˚｡⋆｡˚☽˚｡⋆ ⋆｡˚ ☁︎ ˚｡⋆｡˚☽˚｡⋆ ️");

        Aeroporto aeroporto = new Aeroporto(pistas);

        // tentativa de setar prioridade maior para quem tem menor horário planejado
        int numPartes = 10;
        int tamPartes = Math.max(avioes.length / numPartes, 1);
        for (int i = 0; i < avioes.length; i++) {
            int prioridade = (int) (10 - i / tamPartes);
            avioes[i].setPrioridade(prioridade);
            avioes[i].setAeroporto(aeroporto);
        }

        for (Aviao aviao: avioes) {
            Thread aviaoThread = new Thread(aviao);
            aviaoThread.setPriority(aviao.getPrioridade());
            aviaoThread.start();
        }
    }
}