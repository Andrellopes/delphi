unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tfmain = class(TForm)
    lblEmail: TLabel;
    edtEmail: TEdit;
    btnValid: TButton;
  function IsValidEmail(const Value: string): Boolean;
    procedure btnValidClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmain: Tfmain;

implementation

{$R *.dfm}

procedure Tfmain.btnValidClick(Sender: TObject);
begin
   if IsValidEmail(edtEmail.Text) then
      ShowMessage('Valid Email!')
   else
      ShowMessage('Not Valid Email')
   ;
end;

procedure Tfmain.FormShow(Sender: TObject);
begin
   edtEmail.SetFocus;
end;

function Tfmain.IsValidEmail(const Value: string): Boolean;
   function CheckAllowed(const s: string): Boolean;
   var
      i: Integer;
   begin
      Result := False;
      for i := 1 to Length(s) do
         if not(CharInSet(s[i],['a'..'z','A'..'Z','0'..'9','_','-','.'])) then
            Exit;
      Result := true;
   end;
var
   i: Integer;
   NamePart, ServerPart: string;
begin
   Result := False;
   i      := Pos('@', Value);

   if i = 0 then
      Exit;

   NamePart   := Copy(Value, 1, i - 1);
   ServerPart := Copy(Value, i + 1, Length(Value));

   if (Length(NamePart) = 0) or ((Length(ServerPart) < 5)) then
      Exit;

   i := Pos('.', ServerPart);
   if (i = 0) or (i > (Length(ServerPart) - 2)) then
       Exit;

   Result := CheckAllowed(NamePart) and CheckAllowed(ServerPart);
end;

end.
