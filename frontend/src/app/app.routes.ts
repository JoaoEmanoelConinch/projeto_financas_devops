import { Routes } from '@angular/router';
import { TransacoesComponent } from './transacoes/transacoes.component'; // Certifique-se de que o caminho está correto

export const routes: Routes = [
  { path: '', redirectTo: 'transacoes', pathMatch: 'full' }, // Redireciona para /transacoes por padrão
  { path: 'transacoes', component: TransacoesComponent }, // Define a rota para o componente de transações
  { path: '**', redirectTo: 'transacoes' }, // Redireciona rotas inválidas para transações
];