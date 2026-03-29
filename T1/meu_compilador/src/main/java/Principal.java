import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.Token;
import java.io.PrintWriter;
import java.io.IOException;

/*
 * Classe Principal: Responsável por instanciar o analisador léxico, ler o arquivo de
 * entrada e gerar a lista de tokens ou reportar erros de forma customizada na saída.
 */
public class Principal {
    public static void main(String[] args) {
        // Exige exatamente 2 argumentos (entrada e saída)
        if (args.length < 2) {
            System.out.println("Uso: java -jar meu-compilador.jar <arquivo_entrada> <arquivo_saida>");
            return;
        }

        // Bloco try-with-resources para garantir o fechamento do arquivo de saída
        try (PrintWriter pw = new PrintWriter(args[1])) {
            CharStream cs = CharStreams.fromFileName(args[0]);
            LALexer lexer = new LALexer(cs);

            Token t = null;
            // Lê tokens sequencialmente até encontrar o End Of File (EOF)
            while ((t = lexer.nextToken()).getType() != Token.EOF) {
                String nomeToken = LALexer.VOCABULARY.getSymbolicName(t.getType());
                String textoToken = t.getText();

                // Interrompe imediatamente em caso de erro e escreve a mensagem correspondente
                if (nomeToken.equals("ERRO_SIMBOLO")) {
                    pw.println("Linha " + t.getLine() + ": " + textoToken + " - simbolo nao identificado");
                    break;
                } else if (nomeToken.equals("ERRO_CADEIA_NAO_FECHADA")) {
                    pw.println("Linha " + t.getLine() + ": cadeia literal nao fechada");
                    break;
                } else if (nomeToken.equals("ERRO_COMENTARIO_NAO_FECHADO")) {
                    pw.println("Linha " + t.getLine() + ": comentario nao fechado");
                    break;
                }

                // Formatação da saída para tokens regulares
                if (nomeToken.equals("IDENT") || nomeToken.equals("CADEIA") ||
                    nomeToken.equals("NUM_INT") || nomeToken.equals("NUM_REAL")) {
                    // Tipos complexos imprimem seu identificador de grupo (Ex: <'nome', IDENT>)
                    pw.println("<'" + textoToken + "'," + nomeToken + ">");
                } else {
                    // Palavras-chave e símbolos imprimem seu próprio texto (Ex: <'declare', 'declare'>)
                    pw.println("<'" + textoToken + "','" + textoToken + "'>");
                }
            }
        } catch (IOException e) {
            System.err.println("Erro ao manipular arquivos: " + e.getMessage());
        }
    }
}