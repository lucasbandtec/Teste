package br.com.bandtec.projetopw.domain;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;


@Entity
@Table(name="cidadaos")
public class Cidadao {
	
	@Id
    @GeneratedValue
	private Long id;
	
	private String nome;
	
	@Embedded
	@JsonProperty
	private CPF cpf;
	
	private Integer idade;
	
	@OneToMany(mappedBy = "cidadao", cascade = CascadeType.ALL)
	private List<ConsultaNoSUS> consultas;
	
	protected Cidadao() {}
	
	public Cidadao(String nome, CPF cpf, int idade) {
		this.nome = nome;
		this.cpf = cpf;
		this.idade = idade;
		this.consultas = new ArrayList<>();
	}

	public void inserir(ConsultaNoSUS consulta) {
		System.out.println("\n\n Inserindo nova Consulta: " + consulta.getEspecialidade() + "\n\n");
		consulta.setCidadao(this);
		consultas.add(consulta);
	}

	public Long getId() {
		return id;
	}

	public boolean contem(ConsultaNoSUS consulta) {
		System.out.println("\n\n\n LISTA DE CONSULTAS DO :: " + getNome() + "  CIDADAO: " + consulta.getCidadao().id);
		
		for (ConsultaNoSUS elemento : consultas) {
			System.out.println("  " + elemento.getEspecialidade());
		}
		
		System.out.println("----\n\n\n");
		
//		return true;
		return consultas.contains(consulta);
	}

	public int lerIdade() {
		return idade;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public CPF getCpf() {
		return cpf;
	}

	public void setCpf(CPF cpf) {
		this.cpf = cpf;
	}

	public Integer getIdade() {
		return idade;
	}

	public void setIdade(Integer idade) {
		this.idade = idade;
	}

	public List<ConsultaNoSUS> getConsultas() {
		return consultas;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cpf == null) ? 0 : cpf.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cidadao other = (Cidadao) obj;
		if (cpf == null) {
			if (other.cpf != null)
				return false;
		} else if (!cpf.equals(other.cpf))
			return false;
		return true;
	}
}
