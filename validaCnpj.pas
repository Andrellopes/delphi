unit validaCnpj;

interface
uses
   System.SysUtils;

   function iif(condicao: Boolean; value1, value2: variant): variant;
   function onlyNumberStr(pStr:String): String;
   function validaCnpjCpf(Numero : String) : Boolean;

implementation

function iif(condicao: Boolean; value1, value2: variant): variant;
begin
  if (condicao) then
    result := value1
  else
    result := value2
end;

function onlyNumberStr(pStr:String): String;
Var
   I: Integer;
begin
   Result := '';
   try
      For I := 1 To Length(pStr) do
         If CharInSet(pStr[I],['1','2','3','4','5','6','7','8','9','0']) Then
            Result := Result + pStr[I];
   except on E: Exception do
      Result := '';
   end;
end;

function validaCnpjCpf(Numero : String) : Boolean;
Var
   i,d,b,Digito : Byte;
           Soma : Integer;
           CNPJ : Boolean;
  DgPass,DgCalc : String;
begin
  Result := False;
  Numero := onlyNumberStr(Numero);

  // Caso o número não seja 11 (CPF) ou 14 (CNPJ), aborta
  Case Length(Numero) of
    11: CNPJ := False;
    14: CNPJ := True;
  else
      Exit;
  end;

  // Separa o número do digito
  DgCalc := '';
  DgPass := Copy(Numero,Length(Numero)-1,2);
  Numero := Copy(Numero,1,Length(Numero)-2);

  // Calcula o digito 1 e 2
  For d := 1 to 2 do begin
    B    := IIF(D=1,2,3); // BYTE
    SOMA := IIF(D=1,0,STRTOINTDEF(DGCALC,0)*2);

    for i := Length(Numero) downto 1 do begin
      Soma := Soma + (Ord(Numero[I])-Ord('0'))*b;

      Inc(b);

      If (b > 9) And CNPJ Then
        b := 2;

    end;

    Digito := 11 - Soma mod 11;

    If Digito >= 10 then
      Digito := 0;

    DgCalc := DgCalc + Chr(Digito + Ord('0'));
  end;

  Result := DgCalc = DgPass;
end;

end.
