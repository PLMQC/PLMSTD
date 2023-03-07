tableextension 33000894 "Purchase Line Ext B2B" extends "Purchase Line"
{
    fields
    {
        modify("Line Amount")
        {
            trigger OnBeforeValidate()
            begin
                TestStatusOpen();
            end;
        }

        field(33000890; "Machine Id B2B"; Code[20])
        {
            Caption = 'Machine Id';
            TableRelation = "Equipment B2B";
            DataClassification = CustomerContent;
        }
        field(33000891; "Job Card No. B2B"; Code[20])
        {
            Caption = 'Job Card No.';
            TableRelation = "PM Job Header B2B";
            DataClassification = CustomerContent;
        }
        field(33000892; "Reference No. B2B"; Integer)
        {
            Caption = 'Reference No.';
            DataClassification = CustomerContent;
        }
        field(33000893; "Resource B2B"; Boolean)
        {
            Caption = 'Resource';
            DataClassification = CustomerContent;
        }
        field(33000894; "Spares & Consumables B2B"; Boolean)
        {
            Caption = 'Spares & Consumables';
            DataClassification = CustomerContent;
        }
    }
}