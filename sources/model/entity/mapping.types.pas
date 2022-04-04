unit Mapping.Types;

interface

type
  TRuleAction = (None, Cascade, SetNull, SetDefault);
  TSortingOrder = (NoSort, Ascending, Descending);
  TMultiplicity = (OneToOne, OneToMany, ManyToOne, ManyToMany);
  TGenerated = (Never, Insert, Always);
  TJoin = (InnerJoin, LeftJoin, RightJoin, FullJoin);
  TSequenceType = (NotInc, AutoInc, TableInc, GuidInc);
  TRestriction = (NotNull, NoInsert, NoUpdate, NoValidate, Unique, Hidden, VirtualData);
  TRestrictions = set of TRestriction;
  TCascadeAction = (CascadeNone, CascadeAutoInc, CascadeInsert, CascadeUpdate, CascadeDelete);
  TCascadeActions = set of TCascadeAction;
  TMasterEvent = (AutoPost, AutoEdit, AutoInsert);
  TMasterEvents = set of TMasterEvent;
  TEnumType = (etChar, etString, etInteger, etBoolean);
  TFieldEvent = (onChange, onGetText, onSetText, onValidate);
  TFieldEvents = set of TFieldEvent;

  TOperator = (opeNone, opeWhere, opeAND, opeOR);
  TExpressionOperation = (eoNone, eoAND, eoOR, eoOperation, ooFunction);
  TFlagColumns = (fcAdd, fcIgnore);
  TArrayColumns = array of string;

implementation

end.
