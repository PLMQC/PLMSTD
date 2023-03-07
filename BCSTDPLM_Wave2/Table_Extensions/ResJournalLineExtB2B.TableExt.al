tableextension 33000904 "Res Journal Line Ext B2B" extends "Res. Journal Line"
{

    fields
    {
        field(33000890; "Machine Card B2B"; Code[20])
        {
            Caption = 'Machine Card';
            DataClassification = CustomerContent;
        }
        field(33000891; "Start Time B2B"; Time)
        {
            Caption = 'Start Time';
            DataClassification = CustomerContent;
        }
        field(33000892; "End Time B2B"; Time)
        {
            Caption = 'End Time';
            DataClassification = CustomerContent;
        }
        field(33000893; "Type B2B"; Option)
        {
            Caption = 'Type';
            OptionCaption = '" ,Run Time,Stop Time"';
            OptionMembers = " ","Run Time","Stop Time";
            DataClassification = CustomerContent;
        }
        field(33000894; "Total Hours B2B"; Decimal)
        {
            Caption = 'Total Hours';
            DataClassification = CustomerContent;
        }
        field(33000895; "Remarks B2B"; Text[100])
        {
            Caption = 'Remarks';
            DataClassification = CustomerContent;
        }
        field(33000896; "Machine Id B2B"; Code[20])
        {
            Caption = 'Machine Id';
            DataClassification = CustomerContent;
        }
    }

}

