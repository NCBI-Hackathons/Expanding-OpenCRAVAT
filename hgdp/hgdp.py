import sys
from cravat import BaseAnnotator
from cravat import InvalidData
import sqlite3
import os

class CravatAnnotator(BaseAnnotator):

    def setup(self):
        """
        Set up data sources.
        Cravat will automatically make a connection to
        data/example_annotator.sqlite using the sqlite3 python module. The
        sqlite3.Connection object is stored as self.dbconn, and the
        sqlite3.Cursor object is stored as self.cursor.
        """
        # Verify the connection and cursor exist.
        assert isinstance(self.dbconn, sqlite3.Connection)
        assert isinstance(self.cursor, sqlite3.Cursor)

    def annotate(self, input_data, secondary_data=None):
        """
        The annotator parent class will call annotate for each line of the
        input file. It takes one positional argument, input_data, and one
        keyword argument, secondary_data.

        input_data is a dictionary containing the data from the current input
        line. input_data includes the following keys:
            ('uid', 'chrom', 'pos', 'ref_base', 'alt_base')

        keys in the annotator database (one flat table):
        CHR  POS  ID   REF  ALT    African    European    Middle_Eastern    CS_Asian     East_Asian    Oceanian    Native_American


        should return a dictionary with keys matching the column names
        defined in example_annotator.yml. Extra column names will be ignored,
        and absent column names will be filled with None.
        """
        out = {}

        # get input details
        input_chrom = input_data['chrom'].lower()
        input_pos = input_data['pos']
        input_ref = input_data['ref_base']
        input_alt = input_data['alt_base']

        sql_q = 'SELECT African, European, Middle_Eastern, CS_Asian, East_Asian, Oceanian, Native_American FROM hgdp_table WHERE CHR={} AND POS={} AND REF={} and ALT={};'.format(input_chrom, input_pos, input_ref, input_alt)

        self.cursor.execute(sql_q)
        sql_q_result = self.cursor.fetchone()

        african_allele_freq = ''
        european_allele_freq = ''


        if sql_q_result:
            african_allele_freq += sql_q_result[0]
            out['african_allele_freq'] = african_allele_freq

            european_allele_freq += sql_q_result[1]
            out['european_allele_freq'] = european_allele_freq

            return out


    def cleanup(self):
        """
        cleanup is called after every input line has been processed. Use it to
        close database connections and file handlers. Automatically opened
        database connections are also automatically closed.
        """
        pass

if __name__ == '__main__':
    annotator = CravatAnnotator(sys.argv)
    annotator.run()
