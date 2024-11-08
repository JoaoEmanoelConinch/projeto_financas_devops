import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { TransacaoService } from '../transacoes.service';

interface Transacao{
  id?: number;
  descricao: string;
  valor: number;
  data: string;
}

@Component({
  selector: 'app-transacoes',
  standalone: true,
  imports: [FormsModule, CommonModule],
  templateUrl: './transacoes.component.html',
  styleUrl: './transacoes.component.css'
})
export class TransacoesComponent implements OnInit {
  transacoes: Transacao[] = [];
  descricao: string = '';
  valor: number = 0;
  data: string = '';

  constructor(private transacaoService: TransacaoService) {}
  
  ngOnInit(): void {
    this.obterTransacoes();
  }

  obterTransacoes(): void {
    this.transacaoService.getTransacoes().subscribe(transacoes => {
      this.transacoes = transacoes;
    });
  }

  adicionarTransacao(): void {
    const novaTransacao: Transacao = {
      descricao: this.descricao,
      valor: this.valor,
      data: this.data
    };                                                              
    this.transacaoService.addTransacao(novaTransacao).subscribe(transacao => {
      this.transacoes.push(transacao);
      this.descricao = '';
      this.valor = 0;
      this.data = '';
    });
  }

  removerTransacao(id: number): void {
    this.transacaoService.deleteTransacoes(id).subscribe(() => {
      this.transacoes = this.transacoes.filter(t => t.id !== id);
    });
  }
}
