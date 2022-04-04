unit rtti.helper;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.ToolWin,
  Data.DB, Datasnap.DBClient, System.Rtti, System.TypInfo,
  System.Generics.Collections,
  mapping.attributes;

type
  TRttiHelper = class helper for TObject
  public
    procedure PopularFormFields(const AObject: TObject; const AForm: TForm);
    procedure PopularClientDataSet(const AObject: TObject;
      const AList: TObjectList<TObject>; var AClientDataSet: TClientDataSet);
    procedure CreateClientDataSet(const AObject: TObject;
      var AClientDataSet: TClientDataSet);
  end;

implementation

{ TRttiHelper }

procedure TRttiHelper.CreateClientDataSet(const AObject: TObject;
  var AClientDataSet: TClientDataSet);
var
  lColumns: TColumnMappingList;
  LColumn: TColumnMapping;
begin
  if AClientDataSet = nil then
    raise Exception.CreateFmt('MSG_DAYASET_NOT_FOUND', [AClientDataSet.Name]);

  lColumns := TMappingExplorer.GetMappingColumn(AObject.ClassType);
  if lColumns = nil then
    raise Exception.CreateFmt('MSG_COLUMN_NOT_FOUND', [AObject.ClassName]);

  AClientDataSet.DisableControls;
  if AClientDataSet.Active then
  begin
    AClientDataSet.EmptyDataSet;
    AClientDataSet.Close;
  end;

  AClientDataSet.FieldDefs.Clear;
  for lColumn in LColumns do
  begin
    if LColumn.ColumnProperty = nil then
      Continue;

    with AClientDataSet.FieldDefs.AddFieldDef do
    begin
      Name := lColumn.ColumnName;
      DataType := lColumn.FieldType;
      Size := lColumn.Size;
      DisplayName := lColumn.Description;
    end;
  end;
  AClientDataSet.CreateDataSet;
  AClientDataSet.EnableControls;
end;

procedure TRttiHelper.PopularClientDataSet(const AObject: TObject;
  const AList: TObjectList<TObject>; var AClientDataSet: TClientDataSet);
var
  lContext: TRttiContext;
  lRttiType: TRttiType;
  lProperty: TRttiProperty;
  lEntity: TObject;
  lField: TField;
  i: Integer;
begin
  if AClientDataSet = nil then
    raise Exception.CreateFmt('MSG_DAYASET_NOT_FOUND', [AClientDataSet.Name]);

  AClientDataSet.DisableControls;
  if AClientDataSet.Active then
  begin
    //AClientDataSet.EmptyDataSet;
    //AClientDataSet.Close;;
  end;

  //AClientDataSet.Open;
  lContext := TRttiContext.Create;
  try
    lRttiType := lContext.GetType(AObject.ClassType);
    for lEntity in AList do
    begin
      AClientDataSet.Append;
      for I := 0 to Pred(AClientDataSet.FieldCount) do
      begin
        lField := AClientDataSet.Fields[i];
        lProperty := lRttiType.GetProperty(lField.FieldName);
        if LProperty = nil then
          Continue;

        case lProperty.PropertyType.TypeKind of
          tkString,
          tkChar,
          tkWChar,
          tkLString,
          tkWString,
          tkUString:
            lField.AsString := lProperty.GetValue(lEntity).AsString;
          tkFloat:
          begin
            if (CompareText(lProperty.PropertyType.Name, 'TDateTime') = 0) then
              lField.AsDateTime := lProperty.GetValue(lEntity).AsType<TDateTime>
            else
              lField.AsCurrency := lProperty.GetValue(lEntity).AsCurrency;
          end;
          tkInteger,
          tkInt64:
            lField.AsInteger := lProperty.GetValue(lEntity).AsInteger;
          tkVariant:
            lField.AsVariant := lProperty.GetValue(lEntity).AsVariant;
        else
          raise Exception.Create('MSG_KINDTYPE_NOT_FOUND');
        end;
      end;

      //AClientDataSet.Post;
    end;

    AClientDataSet.First;
  finally
    lContext.Free;
    AClientDataSet.EnableControls;
  end;
end;

procedure TRttiHelper.PopularFormFields(const AObject: TObject; const AForm: TForm);
var
  lContext: TRttiContext;
  lRttiType: TRttiType;
  lProperty: TRttiProperty;
  lComponent: TComponent;
begin
  if AForm = nil then
    raise Exception.Create('MSG_FORM_NOT_FOUND');

  if AObject = nil then
    raise Exception.CreateFmt('MSG_FORM_NOT_FOUND', [AObject.ClassName]);

  lContext := TRttiContext.Create;
  try
    lRttiType := lContext.GetType(AObject.ClassType);
    for lProperty in lRttiType.GetProperties do
    begin
      if LProperty = nil then
        Continue;

      lComponent := AForm.FindComponent('Campo' + LProperty.Name);
      if (lComponent = nil) then
        Continue;

      //if lComponent is TLabel then
        //(lComponent as TLabel).Caption := ;

      if lComponent is TCustomEdit then
      begin
        case lProperty.PropertyType.TypeKind of
          tkString,
          tkChar,
          tkWChar,
          tkLString,
          tkWString,
          tkUString:
            (lComponent as TCustomEdit).Text := lProperty.GetValue(AObject).AsString;

          tkInteger,
          tkInt64,
          tkVariant:
            (lComponent as TCustomEdit).Text := IntToStr(lProperty.GetValue(AObject).AsInteger);

          tkFloat:
            if (CompareText(lProperty.PropertyType.Name, 'TDateTime') = 0) then
              (lComponent as TCustomEdit).Text := DateTimeToStr(lProperty.GetValue(AObject).AsType<TDateTime>)
            else
              (lComponent as TCustomEdit).Text := CurrToStr(lProperty.GetValue(AObject).AsCurrency);
        else
          raise Exception.Create('MSG_KINDTYPE_NOT_FOUND');
        end;
      end;
    end;
  finally
    lContext.Free;
  end;
end;

end.
