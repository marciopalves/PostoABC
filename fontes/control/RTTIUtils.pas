unit RTTIUtils;

interface


type
  NotNull = class(TCustomAttribute)
    private
      FMensagem: String;
    public
      constructor Create( pMsg: String);
      property Mensagem: String read FMensagem write FMensagem;
  end;

 MinLength = class (TCustomAttribute)
   private
    FLength: Integer;
    FMensagem: String;
   public
     constructor Create( pLength: Integer; pMsg: String);
     property Length: Integer read FLength write FLength;
     property Mensagem: String read FMensagem write FMensagem;
 end;

 type
   NotZero = class (TCustomAttribute)
     private
       FMensagem: String;
     public
       constructor Create( pMsg: String);
       property Mensagem: String read FMensagem write FMensagem;
   end;

type
  TRTTIUTtils = class
    private
    public
      class function ValidarCampos( pObject: TObject): Boolean;
  end;

implementation

Uses System.Rtti, System.SysUtils;

{ TNotNull }

constructor NotNull.Create(pMsg: String);
begin
  FMensagem := pMsg;
end;

{ MinLength }

constructor MinLength.Create(pLength: Integer; pMsg: String);
begin
  FLength := pLength;
  FMensagem := pMsg;
end;

{ NotZero }

constructor NotZero.Create(pMsg: String);
begin
  FMensagem := pMsg;
end;

{ TRTTIUTtils }

class function TRTTIUTtils.ValidarCampos(pObject: TObject): Boolean;
Var
  ctxContext: TRttiContext;
  typRtti: TRttiType;
  prpRtti: TRttiProperty;
  cusAttr: TCustomAttribute;
begin
  result := True;
  ctxContext:= TRTTiContext.Create;
  try
    typRtti := ctxContext.GetType(pObject.ClassType);
    for prpRtti in typRtti.GetProperties do
      for cusAttr in prpRtti.GetAttributes do
      begin
        if cusAttr is NotNull then
        begin
          case prpRtti.GetValue(pObject).TypeInfo.Kind of
            tkUString:
            begin
              if prpRtti.GetValue(pObject).AsString.Trim.IsEmpty then
              begin
                result:= false;
                raise Exception.Create(NotNull(cusAttr).Mensagem);
              end;
            end;
          end;
        end;

        if cusAttr is MinLength then
        begin
          if (Length(prpRtti.GetValue(pObject).AsString) < MinLength(cusAttr).Length) then
          begin
            result := False;
            raise Exception.Create(MinLength(cusAttr).Mensagem);
          end;
        end;

        if cusAttr is NotZero then
        begin
          if Integer(prpRtti.GetValue(pObject).AsVariant) <= 0 then
          begin
            result := False;
            raise Exception.Create(NotZero(cusAttr).Mensagem);
          end;
        end;
      end;

  finally
    ctxContext.Free;
  end;
end;

end.
