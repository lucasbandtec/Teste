/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package primeiroprograma;

import java.util.Scanner;

/**
 *
 * @author Aluno
 */
public class PrimeiroPrograma {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        String turma= "A";
        System.out.println("Bemvindos ao 2o semestre!!!");
        System.out.print("Hora do intervalo!\t\t\n\n");
        System.out.println("Primeiro programa em Java");
        System.out.println("Turma 2ADS" + turma);
        
        //Criação do objeto leitor da classe Scanner 
        //Para fazer leitura de dados do teclado
        Scanner leitor = new Scanner(System.in);
        //Pede para o usuario digitar o nome
        System.out.println("Digite o seu nome: ");
        //Leitura do nome e atribuição para a variável nome
        String nome = leitor.nextLine();
        
        System.out.println("Boa Noite, " + nome);
        // Declaração de variável inteira
        int idade;
        int a,b;
        
        //Pede para o usuario digitar a idade
        System.out.println("Digite a sua idade: ");
        //Leituda da idade digitada e atribuição para variável
        idade = leitor.nextInt();
        
        if (idade >= 18) {
            System.out.println("Já pode tirar carteira de habilitação");
        }
        else {
            System.out.println("Não pode tirar carteira de habilitação");
        }
        
        a = 3;
        b = a++;
        System.out.println("b= " + b + "\ta= " + a);
        b = ++a;
        System.out.println("b= " + b + "\ta= " + a);
    }
    
}
