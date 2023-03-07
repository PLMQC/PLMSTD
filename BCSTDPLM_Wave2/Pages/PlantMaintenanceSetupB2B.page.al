page 33000891 "Plant Maintenance Setup B2B"
{

    Caption = 'Plant Maintenance Setup';
    UsageCategory = Administration;
    ApplicationArea = all;
    PageType = Card;
    SourceTable = "Plant Maintenance Setup B2B";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("PM Calendar Code"; Rec."PM Calendar Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Plant Maintenance Calendar Code is Defined against the PM calendar. Which Specifies the Dates and Times of the Plant Maintenance Jobs';
                }
                field(Allowance; Rec.Allowance)
                {
                    ApplicationArea = all;
                    ToolTip = 'This field indicates the number of days the system allows the user to create a job card for preventive maintenance beyond the scheduled date of maintenance.';
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Need to Specify the G/L Account Number.';
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Need to specify the Item category Code for Spare parts.';
                }
            }
            group(Posting)
            {
                Caption = 'Posting';
                field("Item Template"; Rec."Item Template")
                {
                    ApplicationArea = all;
                    ToolTip = 'A template is a Pre formatted page. Need to Specify the Item Template for Posting.';
                }
                field("Item Journal Batch"; Rec."Item Journal Batch")
                {
                    ApplicationArea = all;
                    ToolTip = 'Need to Specify the Batch fro Item Journal.';
                }
                field("Resource Template"; Rec."Resource Template")
                {
                    ApplicationArea = all;
                    ToolTip = 'A template is a Pre formatted page. Need to Specify the Resource Template.';
                }
                field("Resource Journal Batch"; Rec."Resource Journal Batch")
                {
                    ApplicationArea = all;
                    ToolTip = 'Need to Specify the Journal Batch for Resource.';
                }
                field("Equipment Template"; Rec."Equipment Template")
                {
                    ApplicationArea = all;
                    Tooltip = 'Equipment Template need to Specified.';
                }
                field("Equipment Journal Batch"; Rec."Equipment Journal Batch")
                {
                    ApplicationArea = all;
                    ToolTip = 'Equipment Journal Batch need to be specified.';
                }
                field("Fixed Asset Template"; Rec."Fixed Asset Template")
                {
                    ApplicationArea = all;
                    ToolTip = 'Fixed Asset Template need to be Specified.';
                }
                field("Fixed Asset Journal Batch"; Rec."Fixed Asset Journal Batch")
                {
                    ApplicationArea = all;
                    ToolTip = 'Select Batch for Fixed Asset Journal.';
                }
                field("General Journal Line Batch"; Rec."General Journal Line Batch")
                {
                    ApplicationArea = all;
                    ToolTip = 'Select Batch For Genereal Journal Line.';
                }
            }
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Machine Nos."; Rec."Machine Nos.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Machine Number Series need to Assign.';
                }
                field("Machine Spec. Nos."; Rec."Machine Spec. Nos.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Machine Specification number Series Need to Assign.';
                }
                field("PM Sepc. Template Nos."; Rec."PM Sepc. Template Nos.")
                {
                    ApplicationArea = all;
                    Tooltip = 'In this user Specifies the Preventive Maintenance Specifications Templates Number series.';
                }
                field("Maint. Sch. TemplateNos."; Rec."Maint. Sch. TemplateNos.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Maintenance Schedule Number series need to be Speicified.';
                }
                field("Maint. Sch. TempLineNo"; Rec."Maint. Sch. TempLineNo")
                {
                    ApplicationArea = all;
                    ToolTip = 'Maintenance Schdule Template Line Number series need to be Mention.';
                }
                field("Machine Spare Nos."; Rec."Machine Spare Nos.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Spares Number series need to be mention.';
                }
                field("PM Movement Nos."; Rec."PM Movement Nos.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Preventive Maintenance Movement Number series need to be mention.';
                }
                field("PM Spare Master Nos."; Rec."PM Spare Master Nos.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Preventive Maintenance Spare masters Number series need to be mention.';
                }
                field("PMR Job Card"; Rec."PMR Job Card")
                {
                    ApplicationArea = all;
                    ToolTip = 'PMR Job card Number series need to mention.';
                }
                field("Complaint Nos."; Rec."Complaint Nos.")
                {
                    ApplicationArea = all;
                    tooltip = 'Complaint Number series need to be mention.';
                }
                field("Check List Nos."; Rec."Check List Nos.")
                {
                    ApplicationArea = all;
                    Tooltip = 'Checklist Nuber series need to be mention.';
                }
                field("Break Down Job Card"; Rec."Break Down Job Card")
                {
                    ApplicationArea = all;
                    ToolTip = 'Break down Job Card number series need to mention.';
                }
                field("Others Job Card"; Rec."Others Job Card")
                {
                    ApplicationArea = all;
                    ToolTip = 'Other Job card Number Series need to mention.';
                }
                field("Run Time Freqency No."; Rec."Run Time Freqency No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Run Time Frequency Number series need to be Mention.';
                }
                field("Test For Predictive No."; Rec."Test For Predictive No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Test For Predictive Number Series Need to be mention.';
                }
            }
        }
    }

    actions
    {
    }
}

