import { TestBed } from '@angular/core/testing';

import { TransacaoService } from './transacoes.service';
import { provideHttpClient } from '@angular/common/http';
import { provideHttpClientTesting } from '@angular/common/http/testing';

describe('TransacoesService', () => {
  let service: TransacaoService;

  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [TransacaoService,
        provideHttpClient(),
        provideHttpClientTesting()
      ]
    });
    service = TestBed.inject(TransacaoService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
