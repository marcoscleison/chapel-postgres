/*
 * Copyright (C) 2016 Marcos Cleison Silva Santana
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

module Postgres{
    use SysBasic;
    //require "libpq-fe.h";
    require "postgresql/libpq-fe.h";
require "stdio.h";

extern const CONNECTION_OK:int(64);   

extern const PGRES_TUPLES_OK:int(64); 

extern record FILE{

}

extern record Oid{
}

extern record pg_int64{
}

extern const ConnStatusType:int(64);

extern const PostgresPollingStatusType:int(64);

extern const ExecStatusType:int(64);

extern const PGTransactionStatusType:int(64);

extern record PGVerbosity{
}

extern record PGPing{
}

extern record PGconn{
}

extern record PGresult{
}

extern record PGcancel{
}

extern record PGnotify{
}

extern record PQnoticeReceiver{
}

extern record PQnoticeProcessor{
}

extern record pqbool{
}

extern record PQprintOpt{
}

extern record PQconninfoOption{
}

extern record PQArgBlock{
}

extern record PGresAttDesc{
}

extern proc  PQconnectStart(conninfo: c_string ):c_ptr(PGconn );
extern proc  PQconnectStartParams(keywords: c_string, values: c_string, expand_dbname: c_int ):c_ptr(PGconn );
extern proc  PQconnectPoll(conn: c_ptr(PGconn ) ):PostgresPollingStatusType;
extern proc  PQconnectdb(conninfo: c_string ):c_ptr(PGconn );
extern proc  PQconnectdbParams(keywords: c_string, values: c_string, expand_dbname: c_int ):c_ptr(PGconn );
extern proc  PQsetdbLogin(pghost: c_string, pgport: c_string, pgoptions: c_string, pgtty: c_string, dbName: c_string, login: c_string, pwd: c_string ):c_ptr(PGconn );
extern proc  PQfinish(conn: c_ptr(PGconn ) ):c_void_ptr;
extern proc  PQconndefaults():c_ptr(PQconninfoOption );
extern proc  PQconninfoParse(conninfo: c_string, errmsg: c_ptr(c_char ) ):c_ptr(PQconninfoOption );
extern proc  PQconninfo(conn: c_ptr(PGconn ) ):c_ptr(PQconninfoOption );
extern proc  PQconninfoFree(connOptions: c_ptr(PQconninfoOption ) ):c_void_ptr;
extern proc  PQresetStart(conn: c_ptr(PGconn ) ):c_int;
extern proc  PQresetPoll(conn: c_ptr(PGconn ) ):PostgresPollingStatusType;
extern proc  PQreset(conn: c_ptr(PGconn ) ):c_void_ptr;
extern proc  PQgetCancel(conn: c_ptr(PGconn ) ):c_ptr(PGcancel );
extern proc  PQfreeCancel(cancel: c_ptr(PGcancel ) ):c_void_ptr;
extern proc  PQcancel(cancel: c_ptr(PGcancel ), errbuf: c_ptr(c_char), errbufsize: c_int ):c_int;
extern proc  PQrequestCancel(conn: c_ptr(PGconn ) ):c_int;
extern proc  PQdb(conn: c_ptr( PGconn ) ):c_ptr(c_char);
extern proc  PQuser(conn: c_ptr( PGconn ) ):c_ptr(c_char);
extern proc  PQpass(conn: c_ptr( PGconn ) ):c_ptr(c_char);
extern proc  PQhost(conn: c_ptr( PGconn ) ):c_ptr(c_char);
extern proc  PQport(conn: c_ptr( PGconn ) ):c_ptr(c_char);
extern proc  PQtty(conn: c_ptr( PGconn ) ):c_ptr(c_char);
extern proc  PQoptions(conn: c_ptr( PGconn ) ):c_ptr(c_char);
extern proc  PQstatus(conn: c_ptr( PGconn ) ):ConnStatusType;
extern proc  PQtransactionStatus(conn: c_ptr( PGconn ) ):PGTransactionStatusType;
extern proc  PQparameterStatus(conn: c_ptr( PGconn ), paramName: c_string ):c_string;
extern proc  PQprotocolVersion(conn: c_ptr( PGconn ) ):c_int;
extern proc  PQserverVersion(conn: c_ptr( PGconn ) ):c_int;
extern proc  PQerrorMessage(conn: c_ptr( PGconn ) ):c_ptr(c_char);
extern proc  PQsocket(conn: c_ptr( PGconn ) ):c_int;
extern proc  PQbackendPID(conn: c_ptr( PGconn ) ):c_int;
extern proc  PQconnectionNeedsPassword(conn: c_ptr( PGconn ) ):c_int;
extern proc  PQconnectionUsedPassword(conn: c_ptr( PGconn ) ):c_int;
extern proc  PQclientEncoding(conn: c_ptr( PGconn ) ):c_int;
extern proc  PQsetClientEncoding(conn: c_ptr(PGconn ), encoding: c_string ):c_int;
extern proc  PQsslInUse(conn: c_ptr(PGconn ) ):c_int;
extern proc  PQsslStruct(conn: c_ptr(PGconn ), struct_name: c_string ):c_void_ptr;
extern proc  PQsslAttribute(conn: c_ptr(PGconn ), attribute_name: c_string ):c_string;
extern proc  PQsslAttributeNames(conn: c_ptr(PGconn ) ):c_string;
extern proc  PQgetssl(conn: c_ptr(PGconn ) ):c_void_ptr;
extern proc  PQinitSSL(do_init: c_int ):c_void_ptr;
extern proc  PQinitOpenSSL(do_ssl: c_int, do_crypto: c_int ):c_void_ptr;
extern proc  PQsetErrorVerbosity(conn: c_ptr(PGconn ), verbosity: PGVerbosity ):PGVerbosity;
extern proc  PQtrace(conn: c_ptr(PGconn ), debug_port: c_ptr(FILE ) ):c_void_ptr;
extern proc  PQuntrace(conn: c_ptr(PGconn ) ):c_void_ptr;
extern proc  PQsetNoticeReceiver(conn: c_ptr(PGconn ), _proc: PQnoticeReceiver, arg: c_void_ptr ):PQnoticeReceiver;
extern proc  PQsetNoticeProcessor(conn: c_ptr(PGconn ), _proc: PQnoticeProcessor, arg: c_void_ptr ):PQnoticeProcessor;
extern record pgthreadlock_t{
}

extern proc  PQregisterThreadLock(newhandler: pgthreadlock_t ):pgthreadlock_t;
extern proc  PQexec(conn: c_ptr(PGconn ), query: c_string ):c_ptr(PGresult );
extern proc  PQexecParams(conn: c_ptr(PGconn ), command: c_string, nParams: c_int, paramTypes: c_ptr( Oid ), paramValues: c_string, paramLengths: c_ptr( int ), paramFormats: c_ptr( int ), resultFormat: c_int ):c_ptr(PGresult );
extern proc  PQprepare(conn: c_ptr(PGconn ), stmtName: c_string, query: c_string, nParams: c_int, paramTypes: c_ptr( Oid ) ):c_ptr(PGresult );
extern proc  PQexecPrepared(conn: c_ptr(PGconn ), stmtName: c_string, nParams: c_int, paramValues: c_string, paramLengths: c_ptr( int ), paramFormats: c_ptr( int ), resultFormat: c_int ):c_ptr(PGresult );
extern proc  PQsendQuery(conn: c_ptr(PGconn ), query: c_string ):c_int;
extern proc  PQsendQueryParams(conn: c_ptr(PGconn ), command: c_string, nParams: c_int, paramTypes: c_ptr( Oid ), paramValues: c_string, paramLengths: c_ptr( int ), paramFormats: c_ptr( int ), resultFormat: c_int ):c_int;
extern proc  PQsendPrepare(conn: c_ptr(PGconn ), stmtName: c_string, query: c_string, nParams: c_int, paramTypes: c_ptr( Oid ) ):c_int;
extern proc  PQsendQueryPrepared(conn: c_ptr(PGconn ), stmtName: c_string, nParams: c_int, paramValues: c_string, paramLengths: c_ptr( int ), paramFormats: c_ptr( int ), resultFormat: c_int ):c_int;
extern proc  PQsetSingleRowMode(conn: c_ptr(PGconn ) ):c_int;
extern proc  PQgetResult(conn: c_ptr(PGconn ) ):c_ptr(PGresult );
extern proc  PQisBusy(conn: c_ptr(PGconn ) ):c_int;
extern proc  PQconsumeInput(conn: c_ptr(PGconn ) ):c_int;
extern proc  PQnotifies(conn: c_ptr(PGconn ) ):c_ptr(PGnotify );
extern proc  PQputCopyData(conn: c_ptr(PGconn ), buffer: c_string, nbytes: c_int ):c_int;
extern proc  PQputCopyEnd(conn: c_ptr(PGconn ), errormsg: c_string ):c_int;
extern proc  PQgetCopyData(conn: c_ptr(PGconn ), buffer: c_ptr(c_char ), async: c_int ):c_int;
extern proc  PQgetline(conn: c_ptr(PGconn ),_string: c_ptr(c_char), length: c_int ):c_int;
extern proc  PQputline(conn: c_ptr(PGconn ),_string: c_string ):c_int;
extern proc  PQgetlineAsync(conn: c_ptr(PGconn ), buffer: c_ptr(c_char), bufsize: c_int ):c_int;
extern proc  PQputnbytes(conn: c_ptr(PGconn ), buffer: c_string, nbytes: c_int ):c_int;
extern proc  PQendcopy(conn: c_ptr(PGconn ) ):c_int;
extern proc  PQsetnonblocking(conn: c_ptr(PGconn ), arg: c_int ):c_int;
extern proc  PQisnonblocking(conn: c_ptr( PGconn ) ):c_int;
extern proc  PQisthreadsafe():c_int;
extern proc  PQping(conninfo: c_string ):PGPing;
extern proc  PQpingParams(keywords: c_string, values: c_string, expand_dbname: c_int ):PGPing;
extern proc  PQflush(conn: c_ptr(PGconn ) ):c_int;
extern proc  PQfn(conn: c_ptr(PGconn ), fnid: c_int, result_buf: c_ptr(c_int), result_len: c_ptr(c_int), result_is_int: c_int, args: c_ptr( PQArgBlock ), nargs: c_int ):c_ptr(PGresult );
extern proc  PQresultStatus(res: c_ptr( PGresult ) ):ExecStatusType;
extern proc  PQresStatus(status: ExecStatusType ):c_ptr(c_char);
extern proc  PQresultErrorMessage(res: c_ptr( PGresult ) ):c_ptr(c_char);
extern proc  PQresultErrorField(res: c_ptr( PGresult ), fieldcode: c_int ):c_ptr(c_char);
extern proc  PQntuples(res: c_ptr( PGresult ) ):c_int;
extern proc  PQnfields(res: c_ptr( PGresult ) ):c_int;
extern proc  PQbinaryTuples(res: c_ptr( PGresult ) ):c_int;
extern proc  PQfname(res: c_ptr( PGresult ), field_num: c_int ):c_string;//c_ptr(c_char);
extern proc  PQfnumber(res: c_ptr( PGresult ), field_name: c_string ):c_int;
extern proc  PQftable(res: c_ptr( PGresult ), field_num: c_int ):Oid;
extern proc  PQftablecol(res: c_ptr( PGresult ), field_num: c_int ):c_int;
extern proc  PQfformat(res: c_ptr( PGresult ), field_num: c_int ):c_int;
extern proc  PQftype(res: c_ptr( PGresult ), field_num: c_int ):Oid;
extern proc  PQfsize(res: c_ptr( PGresult ), field_num: c_int ):c_int;
extern proc  PQfmod(res: c_ptr( PGresult ), field_num: c_int ):c_int;
extern proc  PQcmdStatus(res: c_ptr(PGresult ) ):c_ptr(c_char);
extern proc  PQoidStatus(res: c_ptr( PGresult ) ):c_ptr(c_char);
extern proc  PQoidValue(res: c_ptr( PGresult ) ):Oid;
extern proc  PQcmdTuples(res: c_ptr(PGresult ) ):c_ptr(c_char);
extern proc  PQgetvalue(res: c_ptr( PGresult ), tup_num: c_int, field_num: c_int ):c_ptr(c_char);
extern proc  PQgetlength(res: c_ptr( PGresult ), tup_num: c_int, field_num: c_int ):c_int;
extern proc  PQgetisnull(res: c_ptr( PGresult ), tup_num: c_int, field_num: c_int ):c_int;
extern proc  PQnparams(res: c_ptr( PGresult ) ):c_int;
extern proc  PQparamtype(res: c_ptr( PGresult ), param_num: c_int ):Oid;
extern proc  PQdescribePrepared(conn: c_ptr(PGconn ), stmt: c_string ):c_ptr(PGresult );
extern proc  PQdescribePortal(conn: c_ptr(PGconn ), portal: c_string ):c_ptr(PGresult );
extern proc  PQsendDescribePrepared(conn: c_ptr(PGconn ), stmt: c_string ):c_int;
extern proc  PQsendDescribePortal(conn: c_ptr(PGconn ), portal: c_string ):c_int;
extern proc  PQclear(res: c_ptr(PGresult ) ):c_void_ptr;
extern proc  PQfreemem(ptr: c_void_ptr ):c_void_ptr;
extern proc  PQmakeEmptyPGresult(conn: c_ptr(PGconn ), status: ExecStatusType ):c_ptr(PGresult );
extern proc  PQcopyResult(src: c_ptr( PGresult ), flags: c_int ):c_ptr(PGresult );
extern proc  PQsetResultAttrs(res: c_ptr(PGresult ), numAttributes: c_int, attDescs: c_ptr(PGresAttDesc ) ):c_int;
extern proc  PQresultAlloc(res: c_ptr(PGresult ), nBytes: c_int ):c_void_ptr;
extern proc  PQsetvalue(res: c_ptr(PGresult ), tup_num: c_int, field_num: c_int, value: c_ptr(c_char), len: c_int ):c_int;
extern proc  PQescapeStringConn():c_int;
extern proc  PQescapeLiteral(conn: c_ptr(PGconn ), str: c_string, len: c_int ):c_ptr(c_char);
extern proc  PQescapeIdentifier(conn: c_ptr(PGconn ), str: c_string, len: c_int ):c_ptr(c_char);
extern proc  PQescapeByteaConn(conn: c_ptr(PGconn ), from: c_ptr( c_uchar), from_length: c_int, to_length: c_ptr(c_int) ):c_ptr(c_uchar);
extern proc  PQunescapeBytea(strtext: c_ptr( c_uchar), retbuflen: c_ptr(c_int) ):c_ptr(c_uchar);
extern proc  PQescapeString():c_int;
extern proc  PQescapeBytea(from: c_ptr( c_uchar), from_length: c_int, to_length: c_ptr(c_int) ):c_ptr(c_uchar);
extern proc  PQprint(fout: c_ptr(FILE ), res: c_ptr( PGresult ), ps: c_ptr( PQprintOpt ) ):c_void_ptr;
extern proc  PQdisplayTuples(res: c_ptr( PGresult ), fp: c_ptr(FILE ), fillAlign: c_int, fieldSep: c_string, printHeader: c_int, quiet: c_int ):c_void_ptr;
extern proc  PQprintTuples(res: c_ptr( PGresult ), fout: c_ptr(FILE ), printAttName: c_int, terseOutput: c_int, width: c_int ):c_void_ptr;
extern proc  lo_open(conn: c_ptr(PGconn ), lobjId: Oid, mode: c_int ):c_int;
extern proc  lo_close(conn: c_ptr(PGconn ), fd: c_int ):c_int;
extern proc  lo_read(conn: c_ptr(PGconn ), fd: c_int, buf: c_ptr(c_char), len: c_int ):c_int;
extern proc  lo_write(conn: c_ptr(PGconn ), fd: c_int, buf: c_string, len: c_int ):c_int;
extern proc  lo_lseek(conn: c_ptr(PGconn ), fd: c_int, offset: c_int, whence: c_int ):c_int;
extern proc  lo_lseek64(conn: c_ptr(PGconn ), fd: c_int, offset: pg_int64, whence: c_int ):pg_int64;
extern proc  lo_creat(conn: c_ptr(PGconn ), mode: c_int ):Oid;
extern proc  lo_create(conn: c_ptr(PGconn ), lobjId: Oid ):Oid;
extern proc  lo_tell(conn: c_ptr(PGconn ), fd: c_int ):c_int;
extern proc  lo_tell64(conn: c_ptr(PGconn ), fd: c_int ):pg_int64;
extern proc  lo_truncate(conn: c_ptr(PGconn ), fd: c_int, len: c_int ):c_int;
extern proc  lo_truncate64(conn: c_ptr(PGconn ), fd: c_int, len: pg_int64 ):c_int;
extern proc  lo_unlink(conn: c_ptr(PGconn ), lobjId: Oid ):c_int;
extern proc  lo_import(conn: c_ptr(PGconn ), filename: c_string ):Oid;
extern proc  lo_import_with_oid(conn: c_ptr(PGconn ), filename: c_string, lobjId: Oid ):Oid;
extern proc  lo_export(conn: c_ptr(PGconn ), lobjId: Oid, filename: c_string ):c_int;
extern proc  PQlibVersion():c_int;
extern proc  PQmblen(s: c_string, encoding: c_int ):c_int;
extern proc  PQdsplen(s: c_string, encoding: c_int ):c_int;
extern proc  PQenv2encoding():c_int;
extern proc  PQencryptPassword(passwd: c_string, user: c_string ):c_ptr(c_char);
extern proc  pg_char_to_encoding(name: c_string ):c_int;
extern proc  pg_encoding_to_char(encoding: c_int ):c_string;
extern proc  pg_valid_server_encoding_id(encoding: c_int ):c_int;

}//end module