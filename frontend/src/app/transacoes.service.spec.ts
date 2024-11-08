import { TestBed } from '@angular/core/testing';

import { TransacaoService } from './transacoes.service';

describe('TransacoesService', () => {
  let service: TransacaoService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TransacaoService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
