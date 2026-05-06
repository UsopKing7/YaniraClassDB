export enum Topic {
  SELECT = 'SELECT',
  INSERT = 'INSERT',
  UPDATE = 'UPDATE',
  DELETE = 'DELETE',
  JOIN = 'JOIN',
  GROUP_BY = 'GROUP_BY',
  HAVING = 'HAVING',
  SUBQUERY = 'SUBQUERY',
  DDL = 'DDL',
  DCL = 'DCL',
  TCL = 'TCL',
  AGGREGATE = 'AGGREGATE'
}

export enum AttempError {
  SYNTAX = 'SYNTAX',
  SEMANTIC = 'SEMANTIC',
  LOGIC = 'LOGIC'
}
