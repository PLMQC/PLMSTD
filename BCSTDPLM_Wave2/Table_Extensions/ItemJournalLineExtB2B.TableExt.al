tableextension 33000896 "Item Journal Line Ext B2B" extends "Item Journal Line"
{

    fields
    {
        field(33000890; "Machine Id B2B"; Code[20])
        {
            Caption = 'Machine Id';
            TableRelation = "Equipment B2B"."No.";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                Machine.RESET();
                Machine.GET("Machine Id B2B");
                if Machine."M/W No." = '' then
                    ERROR(MachineCenterErr, "Machine Id B2B");
            end;
        }
        field(33000891; "Post Worksheet B2B"; Boolean)
        {
            Caption = 'Post Worksheet';
            DataClassification = CustomerContent;
        }

    }

    var
        Machine: Record "Equipment B2B";
        MachineCenterErr: Label 'Machine Center or Work Center must be assigned for %1.', Comment = '%1 = Machine Id B2B';

}

