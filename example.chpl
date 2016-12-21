module Main{
    use Postgres;

require "stdio.h";

extern proc printf(format:c_string,d...?K);

    proc main(){
    
   // var conninfo="dbname=teste user=postgres password=password".localize().c_str();
    var conninfo="postgresql://postgres:password@localhost/teste".localize().c_str();
//
//
    var conn = PQconnectdb(conninfo);

    if (PQstatus(conn) != CONNECTION_OK:ConnStatusType)
    {


                var err=new string(PQerrorMessage(conn):c_string);
                writeln("Connection to database failed: ",err);
                PQfinish(conn);
                halt("Error");
    }

  var res = PQexec(conn, "SELECT * FROM public.contacts");

  if (PQresultStatus(res) != PGRES_TUPLES_OK)
    {
         var err=new string(PQerrorMessage(conn):c_string);
            writeln("Failed to fetch results: ",err);
            PQclear(res);
            PQfinish(conn);       
            halt("Error");
    }
    /* first, print out the attribute names */
    var nFields = PQnfields(res);
    var ii=0;

    while ( ii < nFields){
        var col = new string(PQfname(res, ii:c_int));
        write("\t",col);
         ii+=1;
    }
    writeln("\n++++++++++++++++++++++++++++++++++++++++++++++++++++");
    writeln(" ");    
    /* next, print out the rows */
    var  i=0;
    var j=0;


    while ( i < PQntuples(res))
    {
        var row="";
        while(j < nFields){
             row = new string(PQgetvalue(res, i:c_int, j:c_int):c_string);

            // printf("\t%s".localize().c_str(),PQgetvalue(res,  i:c_int, j:c_int));
           write("\t",row);
             j+=1;
        }       
        writeln("\n");
        i+=1;
    }

    writeln("Number of records =",  PQntuples(res):int);  
    PQclear(res);
    writeln("End of program");
    }
}