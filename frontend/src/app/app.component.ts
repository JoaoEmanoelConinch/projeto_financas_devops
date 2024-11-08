import { Component, importProvidersFrom } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { TransacoesComponent } from "./transacoes/transacoes.component";

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, TransacoesComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})

export class AppComponent {
  title = 'frontend';
}
