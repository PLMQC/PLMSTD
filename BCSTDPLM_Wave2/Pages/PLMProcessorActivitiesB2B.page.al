page 33000987 "PLM Processor Activities B2B"
{

    Caption = 'Plant Maintenance Processor Activities';
    PageType = CardPart;
    SourceTable = "PLM Cue B2B";
    UsageCategory = Documents;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            cuegroup("Equipment Status")

            {
                Caption = 'Equipment Status';
                field("Equipment-Running"; Rec."Equipment-Running")
                {
                    DrillDownPageID = "Equipment List B2B";
                    ApplicationArea = all;
                    ToolTip = 'It Defines Equipment status.';
                }
                field("Equipment - PMR"; Rec."Equipment - PMR")
                {
                    DrillDownPageID = "Equipment List B2B";
                    ApplicationArea = all;
                    ToolTip = 'It Defines Equipment PMR.';
                }
                field("Equipment-Breakdown"; Rec."Equipment-Breakdown")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Breakdown.';
                }
                field("Equipment-Compliants"; Rec."Equipment-Compliants")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Equipment Complaints.';
                }
            }
            cuegroup("PMR Status")
            {
                Caption = 'PMR Status';
                field("PMR- Open"; Rec."PMR- Open")
                {
                    DrillDownPageID = "PM Job List B2B";
                    ApplicationArea = all;
                    ToolTip = 'It Defines PMR Status.';
                    LookupPageID = "PM Job List B2B";
                }
                field("PMR-Released"; Rec."PMR-Released")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines PMR Status.';
                    Caption = 'PMR-Released';
                    DrillDownPageID = "PM Job List B2B";
                    LookupPageID = "PM Job List B2B";
                }
            }

            cuegroup("Breakdown Status")
            {
                Caption = 'Breakdown Status';
                field("Breakdown-Open"; Rec."Breakdown-Open")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Breakdown status.';
                }
                field("Breakdown-Released"; Rec."Breakdown-Released")
                {
                    DrillDownPageID = "Breakdown Job List B2B";
                    ApplicationArea = all;
                    ToolTip = 'It Defines Breakdown status.';
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        Rec.RESET();
        if not Rec.GET() then begin
            Rec.INIT();
            Rec.INSERT();
        end;
        Rec.SETRANGE("Date Filter", 0D, WORKDATE() - 1);
        Rec.SETFILTER("Date Filter2", '>=%1', WORKDATE());
    end;
}

