tableextension 33000905 "Source Code Setup Ext B2B" extends "Source Code Setup"
{
    fields
    {
        field(33000890; "Equipment B2B"; Code[10])
        {
            Caption = 'Equipment';
            TableRelation = "Source Code";
            DataClassification = CustomerContent;
        }
    }

}

