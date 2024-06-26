{******************************************************************}
{                                                                  }
{ Borland Delphi Runtime Library                                   }
{ Windows Address Book (WAB) functions interface unit              }
{                                                                  }
{ Portions created by Microsoft are                                }
{ Copyright (c) 1995-2000 Microsoft Corporation.                   }
{ All Rights Reserved.                                             }
{                                                                  }
{ The original file is: wabtags.h, released 31 Jan 2000.           }
{ The original Pascal code is: WabTags.pas, released 18 Mar 2000.  }
{ The initial developer of the Pascal code is Petr Vones           }
{ (petr.v@mujmail.cz).                                             }
{                                                                  }
{ Portions created by Petr Vones are                               }
{ Copyright (c) 2000 Petr Vones                                    }
{                                                                  }
{ Obtained through:                                                }
{                                                                  }
{ Joint Endeavour of Delphi Innovators (Project JEDI)              }
{                                                                  }
{ You may retrieve the latest version of this file at the Project  }
{ JEDI home page, located at http://delphi-jedi.org                }
{                                                                  }
{ The contents of this file are used with permission, subject to   }
{ the Mozilla Public License Version 1.1 (the "License"); you may  }
{ not use this file except in compliance with the License. You may }
{ obtain a copy of the License at                                  }
{ http://www.mozilla.org/MPL/MPL-1.1.html                          }
{                                                                  }
{ Software distributed under the License is distributed on an      }
{ "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or   }
{ implied. See the License for the specific language governing     }
{ rights and limitations under the License.                        }
{                                                                  }
{******************************************************************}

{*******************************************************************************

  Added some $IfDef compiler derectives to support Borland Delphi 3

  Portions created by ABF software, Inc.
  Copyright (c) 2000 ABF software, Inc.

*******************************************************************************}
unit WabTags;

interface

uses
  Windows, ActiveX, WabDefs;

{$I abf.inc} // Delphi or C++Builder determination there...
{$I wab.inc}

{$ALIGN ON}
{$MINENUMSIZE 4}
{$WEAKPACKAGEUNIT}

{*  The following ranges should be used for all property IDs. Note that
 *  property IDs for objects other than messages and recipients should
 *  all fall in the range 0x3000 to 0x3FFF:
 *
 *  From    To      Kind of property
 *  --------------------------------
 *  0001    0BFF    MAPI_defined envelope property
 *  0C00    0DFF    MAPI_defined per-recipient property
 *  0E00    0FFF    MAPI_defined non-transmittable property
 *  1000    2FFF    MAPI_defined message content property
 *
 *  3000    3FFF    MAPI_defined property (usually not message or recipient)
 *
 *  4000    57FF    Transport-defined envelope property
 *  5800    5FFF    Transport-defined per-recipient property
 *  6000    65FF    User-defined non-transmittable property
 *  6600    67FF    Provider-defined internal non-transmittable property
 *  6800    7BFF    Message class-defined content property
 *  7C00    7FFF    Message class-defined non-transmittable
 *                  property
 *
 *  8000    FFFE    User-defined Name-to-id mapped property
 *
 *  The 3000-3FFF range is further subdivided as follows:
 *
 *  From    To      Kind of property
 *  --------------------------------
 *  3000    33FF    Common property such as display name, entry ID
 *  3400    35FF    Message store object
 *  3600    36FF    Folder or AB container
 *  3700    38FF    Attachment
 *  3900    39FF    Address book object
 *  3A00    3BFF    Mail user
 *  3C00    3CFF    Distribution list
 *  3D00    3DFF    Profile section
 *  3E00    3FFF    Status object }

{ Determine if a property is transmittable }

function FIsTransmittable(ulPropTag: ULONG): BOOL;
{$IfDef C3}{$EXTERNALSYM FIsTransmittable}{$EndIf C3}

{* The range of non-message and non-recipient property IDs (0x3000 - 0x3FFF) is
 * further broken down into ranges to make assigning new property IDs easier.
 *
 *  From    To      Kind of property
 *  --------------------------------
 *  3000    32FF    MAPI_defined common property
 *  3200    33FF    MAPI_defined form property
 *  3400    35FF    MAPI_defined message store property
 *  3600    36FF    MAPI_defined Folder or AB Container property
 *  3700    38FF    MAPI_defined attachment property
 *  3900    39FF    MAPI_defined address book property
 *  3A00    3BFF    MAPI_defined mailuser property
 *  3C00    3CFF    MAPI_defined DistList property
 *  3D00    3DFF    MAPI_defined Profile Section property
 *  3E00    3EFF    MAPI_defined Status property
 *  3F00    3FFF    MAPI_defined display table property
 *}

{*  Properties common to numerous MAPI objects.
 *
 *  Those properties that can appear on messages are in the
 *  non-transmittable range for messages. They start at the high
 *  end of that range and work down.
 *
 *  Properties that never appear on messages are defined in the common
 *  property range (see above).
 *}


{* properties that are common to multiple objects (including message objects)
 * -- these ids are in the non-transmittable range }

const
  PR_ENTRYID                                  = PT_BINARY or $0FFF shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ENTRYID}{$EndIf C3}
  PR_OBJECT_TYPE                              = PT_LONG or $0FFE shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OBJECT_TYPE}{$EndIf C3}
  PR_ICON                                     = PT_BINARY or $0FFD shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ICON}{$EndIf C3}
  PR_MINI_ICON                                = PT_BINARY or $0FFC shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_MINI_ICON}{$EndIf C3}
  PR_STORE_ENTRYID                            = PT_BINARY or $0FFB shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_STORE_ENTRYID}{$EndIf C3}
  PR_STORE_RECORD_KEY                         = PT_BINARY or $0FFA shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_STORE_RECORD_KEY}{$EndIf C3}
  PR_RECORD_KEY                               = PT_BINARY or $0FF9 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_RECORD_KEY}{$EndIf C3}
  PR_MAPPING_SIGNATURE                        = PT_BINARY or $0FF8 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_MAPPING_SIGNATURE}{$EndIf C3}
  PR_ACCESS_LEVEL                             = PT_LONG or $0FF7 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ACCESS_LEVEL}{$EndIf C3}
  PR_INSTANCE_KEY                             = PT_BINARY or $0FF6 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_INSTANCE_KEY}{$EndIf C3}
  PR_ROW_TYPE                                 = PT_LONG or $0FF5 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ROW_TYPE}{$EndIf C3}
  PR_ACCESS                                   = PT_LONG or $0FF4 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ACCESS}{$EndIf C3}

{* properties that are common to multiple objects (usually not including message
   objects)
 * -- these ids are in the transmittable range }

  PR_ROWID                                    = PT_LONG or $3000 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ROWID}{$EndIf C3}
  PR_DISPLAY_NAME                             = PT_TSTRING or $3001 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_DISPLAY_NAME}{$EndIf C3}
  PR_DISPLAY_NAME_W                           = PT_UNICODE or $3001 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_DISPLAY_NAME_W}{$EndIf C3}
  PR_DISPLAY_NAME_A                           = PT_STRING8 or $3001 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_DISPLAY_NAME_A}{$EndIf C3}
  PR_ADDRTYPE                                 = PT_TSTRING or $3002 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ADDRTYPE}{$EndIf C3}
  PR_ADDRTYPE_W                               = PT_UNICODE or $3002 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ADDRTYPE_W}{$EndIf C3}
  PR_ADDRTYPE_A                               = PT_STRING8 or $3002 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ADDRTYPE_A}{$EndIf C3}
  PR_EMAIL_ADDRESS                            = PT_TSTRING or $3003 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_EMAIL_ADDRESS}{$EndIf C3}
  PR_EMAIL_ADDRESS_W                          = PT_UNICODE or $3003 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_EMAIL_ADDRESS_W}{$EndIf C3}
  PR_EMAIL_ADDRESS_A                          = PT_STRING8 or $3003 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_EMAIL_ADDRESS_A}{$EndIf C3}
  PR_COMMENT                                  = PT_TSTRING or $3004 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_COMMENT}{$EndIf C3}
  PR_COMMENT_W                                = PT_UNICODE or $3004 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_COMMENT_W}{$EndIf C3}
  PR_COMMENT_A                                = PT_STRING8 or $3004 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_COMMENT_A}{$EndIf C3}
  PR_DEPTH                                    = PT_LONG or $3005 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_DEPTH}{$EndIf C3}
  PR_PROVIDER_DISPLAY                         = PT_TSTRING or $3006 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PROVIDER_DISPLAY}{$EndIf C3}
  PR_PROVIDER_DISPLAY_W                       = PT_UNICODE or $3006 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PROVIDER_DISPLAY_W}{$EndIf C3}
  PR_PROVIDER_DISPLAY_A                       = PT_STRING8 or $3006 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PROVIDER_DISPLAY_A}{$EndIf C3}
  PR_CREATION_TIME                            = PT_SYSTIME or $3007 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CREATION_TIME}{$EndIf C3}
  PR_LAST_MODIFICATION_TIME                   = PT_SYSTIME or $3008 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_LAST_MODIFICATION_TIME}{$EndIf C3}
  PR_RESOURCE_FLAGS                           = PT_LONG or $3009 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_RESOURCE_FLAGS}{$EndIf C3}
  PR_PROVIDER_DLL_NAME                        = PT_TSTRING or $300A shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PROVIDER_DLL_NAME}{$EndIf C3}
  PR_PROVIDER_DLL_NAME_W                      = PT_UNICODE or $300A shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PROVIDER_DLL_NAME_W}{$EndIf C3}
  PR_PROVIDER_DLL_NAME_A                      = PT_STRING8 or $300A shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PROVIDER_DLL_NAME_A}{$EndIf C3}
  PR_SEARCH_KEY                               = PT_BINARY or $300B shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_SEARCH_KEY}{$EndIf C3}
  PR_PROVIDER_UID                             = PT_BINARY or $300C shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PROVIDER_UID}{$EndIf C3}
  PR_PROVIDER_ORDINAL                         = PT_LONG or $300D shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PROVIDER_ORDINAL}{$EndIf C3}

{ Proptags 35E8-35FF reserved for folders "guaranteed" by PR_VALID_FOLDER_MASK }

{ Folder and AB Container properties }

  PR_CONTAINER_FLAGS                          = PT_LONG or $3600 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CONTAINER_FLAGS}{$EndIf C3}
  PR_FOLDER_TYPE                              = PT_LONG or $3601 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_FOLDER_TYPE}{$EndIf C3}
  PR_CONTENT_COUNT                            = PT_LONG or $3602 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CONTENT_COUNT}{$EndIf C3}
  PR_CONTENT_UNREAD                           = PT_LONG or $3603 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CONTENT_UNREAD}{$EndIf C3}
  PR_CREATE_TEMPLATES                         = PT_OBJECT or $3604 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CREATE_TEMPLATES}{$EndIf C3}
  PR_DETAILS_TABLE                            = PT_OBJECT or $3605 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_DETAILS_TABLE}{$EndIf C3}
  PR_SEARCH                                   = PT_OBJECT or $3607 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_SEARCH}{$EndIf C3}
  PR_SELECTABLE                               = PT_BOOLEAN or $3609 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_SELECTABLE}{$EndIf C3}
  PR_SUBFOLDERS                               = PT_BOOLEAN or $360a shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_SUBFOLDERS}{$EndIf C3}
  PR_STATUS                                   = PT_LONG or $360b shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_STATUS}{$EndIf C3}
  PR_ANR                                      = PT_TSTRING or $360c shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ANR}{$EndIf C3}
  PR_ANR_W                                    = PT_UNICODE or $360c shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ANR_W}{$EndIf C3}
  PR_ANR_A                                    = PT_STRING8 or $360c shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ANR_A}{$EndIf C3}
  PR_CONTENTS_SORT_ORDER                      = PT_MV_LONG or $360d shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CONTENTS_SORT_ORDER}{$EndIf C3}
  PR_CONTAINER_HIERARCHY                      = PT_OBJECT or $360e shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CONTAINER_HIERARCHY}{$EndIf C3}
  PR_CONTAINER_CONTENTS                       = PT_OBJECT or $360f shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CONTAINER_CONTENTS}{$EndIf C3}
  PR_FOLDER_ASSOCIATED_CONTENTS               = PT_OBJECT or $3610 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_FOLDER_ASSOCIATED_CONTENTS}{$EndIf C3}
  PR_DEF_CREATE_DL                            = PT_BINARY or $3611 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_DEF_CREATE_DL}{$EndIf C3}
  PR_DEF_CREATE_MAILUSER                      = PT_BINARY or $3612 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_DEF_CREATE_MAILUSER}{$EndIf C3}
  PR_CONTAINER_CLASS                          = PT_TSTRING or $3613 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CONTAINER_CLASS}{$EndIf C3}
  PR_CONTAINER_CLASS_W                        = PT_UNICODE or $3613 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CONTAINER_CLASS_W}{$EndIf C3}
  PR_CONTAINER_CLASS_A                        = PT_STRING8 or $3613 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CONTAINER_CLASS_A}{$EndIf C3}
  PR_CONTAINER_MODIFY_VERSION                 = PT_I8 or $3614 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CONTAINER_MODIFY_VERSION}{$EndIf C3}
  PR_AB_PROVIDER_ID                           = PT_BINARY or $3615 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_AB_PROVIDER_ID}{$EndIf C3}
  PR_DEFAULT_VIEW_ENTRYID                     = PT_BINARY or $3616 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_DEFAULT_VIEW_ENTRYID}{$EndIf C3}
  PR_ASSOC_CONTENT_COUNT                      = PT_LONG or $3617 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ASSOC_CONTENT_COUNT}{$EndIf C3}
// Don't use 36FE and 36FF


{ AB Object properties }

  PR_DISPLAY_TYPE                             = PT_LONG or $3900 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_DISPLAY_TYPE}{$EndIf C3}
  PR_TEMPLATEID                               = PT_BINARY or $3902 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_TEMPLATEID}{$EndIf C3}
  PR_PRIMARY_CAPABILITY                       = PT_BINARY or $3904 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PRIMARY_CAPABILITY}{$EndIf C3}
  PR_7BIT_DISPLAY_NAME                        = PT_STRING8 or $39FF shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_7BIT_DISPLAY_NAME}{$EndIf C3}

{ Mail user properties }

  PR_ACCOUNT                                  = PT_TSTRING or $3A00 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ACCOUNT}{$EndIf C3}
  PR_ACCOUNT_W                                = PT_UNICODE or $3A00 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ACCOUNT_W}{$EndIf C3}
  PR_ACCOUNT_A                                = PT_STRING8 or $3A00 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ACCOUNT_A}{$EndIf C3}
  PR_ALTERNATE_RECIPIENT                      = PT_BINARY or $3A01 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ALTERNATE_RECIPIENT}{$EndIf C3}
  PR_CALLBACK_TELEPHONE_NUMBER                = PT_TSTRING or $3A02 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CALLBACK_TELEPHONE_NUMBER}{$EndIf C3}
  PR_CALLBACK_TELEPHONE_NUMBER_W              = PT_UNICODE or $3A02 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CALLBACK_TELEPHONE_NUMBER_W}{$EndIf C3}
  PR_CALLBACK_TELEPHONE_NUMBER_A              = PT_STRING8 or $3A02 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CALLBACK_TELEPHONE_NUMBER_A}{$EndIf C3}
  PR_CONVERSION_PROHIBITED                    = PT_BOOLEAN or $3A03 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CONVERSION_PROHIBITED}{$EndIf C3}
  PR_DISCLOSE_RECIPIENTS                      = PT_BOOLEAN or $3A04 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_DISCLOSE_RECIPIENTS}{$EndIf C3}
  PR_GENERATION                               = PT_TSTRING or $3A05 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_GENERATION}{$EndIf C3}
  PR_GENERATION_W                             = PT_UNICODE or $3A05 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_GENERATION_W}{$EndIf C3}
  PR_GENERATION_A                             = PT_STRING8 or $3A05 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_GENERATION_A}{$EndIf C3}
  PR_GIVEN_NAME                               = PT_TSTRING or $3A06 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_GIVEN_NAME}{$EndIf C3}
  PR_GIVEN_NAME_W                             = PT_UNICODE or $3A06 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_GIVEN_NAME_W}{$EndIf C3}
  PR_GIVEN_NAME_A                             = PT_STRING8 or $3A06 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_GIVEN_NAME_A}{$EndIf C3}
  PR_GOVERNMENT_ID_NUMBER                     = PT_TSTRING or $3A07 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_GOVERNMENT_ID_NUMBER}{$EndIf C3}
  PR_GOVERNMENT_ID_NUMBER_W                   = PT_UNICODE or $3A07 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_GOVERNMENT_ID_NUMBER_W}{$EndIf C3}
  PR_GOVERNMENT_ID_NUMBER_A                   = PT_STRING8 or $3A07 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_GOVERNMENT_ID_NUMBER_A}{$EndIf C3}
  PR_BUSINESS_TELEPHONE_NUMBER                = PT_TSTRING or $3A08 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_BUSINESS_TELEPHONE_NUMBER}{$EndIf C3}
  PR_BUSINESS_TELEPHONE_NUMBER_W              = PT_UNICODE or $3A08 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_BUSINESS_TELEPHONE_NUMBER_W}{$EndIf C3}
  PR_BUSINESS_TELEPHONE_NUMBER_A              = PT_STRING8 or $3A08 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_BUSINESS_TELEPHONE_NUMBER_A}{$EndIf C3}
  PR_OFFICE_TELEPHONE_NUMBER                  = PR_BUSINESS_TELEPHONE_NUMBER;
  {$IfDef C3}{$EXTERNALSYM PR_OFFICE_TELEPHONE_NUMBER}{$EndIf C3}
  PR_OFFICE_TELEPHONE_NUMBER_W                = PR_BUSINESS_TELEPHONE_NUMBER_W;
  {$IfDef C3}{$EXTERNALSYM PR_OFFICE_TELEPHONE_NUMBER_W}{$EndIf C3}
  PR_OFFICE_TELEPHONE_NUMBER_A                = PR_BUSINESS_TELEPHONE_NUMBER_A;
  {$IfDef C3}{$EXTERNALSYM PR_OFFICE_TELEPHONE_NUMBER_A}{$EndIf C3}
  PR_HOME_TELEPHONE_NUMBER                    = PT_TSTRING or $3A09 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_TELEPHONE_NUMBER}{$EndIf C3}
  PR_HOME_TELEPHONE_NUMBER_W                  = PT_UNICODE or $3A09 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_TELEPHONE_NUMBER_W}{$EndIf C3}
  PR_HOME_TELEPHONE_NUMBER_A                  = PT_STRING8 or $3A09 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_TELEPHONE_NUMBER_A}{$EndIf C3}
  PR_INITIALS                                 = PT_TSTRING or $3A0A shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_INITIALS}{$EndIf C3}
  PR_INITIALS_W                               = PT_UNICODE or $3A0A shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_INITIALS_W}{$EndIf C3}
  PR_INITIALS_A                               = PT_STRING8 or $3A0A shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_INITIALS_A}{$EndIf C3}
  PR_KEYWORD                                  = PT_TSTRING or $3A0B shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_KEYWORD}{$EndIf C3}
  PR_KEYWORD_W                                = PT_UNICODE or $3A0B shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_KEYWORD_W}{$EndIf C3}
  PR_KEYWORD_A                                = PT_STRING8 or $3A0B shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_KEYWORD_A}{$EndIf C3}
  PR_LANGUAGE                                 = PT_TSTRING or $3A0C shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_LANGUAGE}{$EndIf C3}
  PR_LANGUAGE_W                               = PT_UNICODE or $3A0C shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_LANGUAGE_W}{$EndIf C3}
  PR_LANGUAGE_A                               = PT_STRING8 or $3A0C shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_LANGUAGE_A}{$EndIf C3}
  PR_LOCATION                                 = PT_TSTRING or $3A0D shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_LOCATION}{$EndIf C3}
  PR_LOCATION_W                               = PT_UNICODE or $3A0D shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_LOCATION_W}{$EndIf C3}
  PR_LOCATION_A                               = PT_STRING8 or $3A0D shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_LOCATION_A}{$EndIf C3}
  PR_MAIL_PERMISSION                          = PT_BOOLEAN or $3A0E shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_MAIL_PERMISSION}{$EndIf C3}
  PR_MHS_COMMON_NAME                          = PT_TSTRING or $3A0F shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_MHS_COMMON_NAME}{$EndIf C3}
  PR_MHS_COMMON_NAME_W                        = PT_UNICODE or $3A0F shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_MHS_COMMON_NAME_W}{$EndIf C3}
  PR_MHS_COMMON_NAME_A                        = PT_STRING8 or $3A0F shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_MHS_COMMON_NAME_A}{$EndIf C3}
  PR_ORGANIZATIONAL_ID_NUMBER                 = PT_TSTRING or $3A10 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ORGANIZATIONAL_ID_NUMBER}{$EndIf C3}
  PR_ORGANIZATIONAL_ID_NUMBER_W               = PT_UNICODE or $3A10 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ORGANIZATIONAL_ID_NUMBER_W}{$EndIf C3}
  PR_ORGANIZATIONAL_ID_NUMBER_A               = PT_STRING8 or $3A10 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ORGANIZATIONAL_ID_NUMBER_A}{$EndIf C3}
  PR_SURNAME                                  = PT_TSTRING or $3A11 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_SURNAME}{$EndIf C3}
  PR_SURNAME_W                                = PT_UNICODE or $3A11 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_SURNAME_W}{$EndIf C3}
  PR_SURNAME_A                                = PT_STRING8 or $3A11 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_SURNAME_A}{$EndIf C3}
  PR_ORIGINAL_ENTRYID                         = PT_BINARY or $3A12 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ORIGINAL_ENTRYID}{$EndIf C3}
  PR_ORIGINAL_DISPLAY_NAME                    = PT_TSTRING or $3A13 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ORIGINAL_DISPLAY_NAME}{$EndIf C3}
  PR_ORIGINAL_DISPLAY_NAME_W                  = PT_UNICODE or $3A13 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ORIGINAL_DISPLAY_NAME_W}{$EndIf C3}
  PR_ORIGINAL_DISPLAY_NAME_A                  = PT_STRING8 or $3A13 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ORIGINAL_DISPLAY_NAME_A}{$EndIf C3}
  PR_ORIGINAL_SEARCH_KEY                      = PT_BINARY or $3A14 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ORIGINAL_SEARCH_KEY}{$EndIf C3}
  PR_POSTAL_ADDRESS                           = PT_TSTRING or $3A15 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_POSTAL_ADDRESS}{$EndIf C3}
  PR_POSTAL_ADDRESS_W                         = PT_UNICODE or $3A15 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_POSTAL_ADDRESS_W}{$EndIf C3}
  PR_POSTAL_ADDRESS_A                         = PT_STRING8 or $3A15 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_POSTAL_ADDRESS_A}{$EndIf C3}
  PR_COMPANY_NAME                             = PT_TSTRING or $3A16 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_COMPANY_NAME}{$EndIf C3}
  PR_COMPANY_NAME_W                           = PT_UNICODE or $3A16 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_COMPANY_NAME_W}{$EndIf C3}
  PR_COMPANY_NAME_A                           = PT_STRING8 or $3A16 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_COMPANY_NAME_A}{$EndIf C3}
  PR_TITLE                                    = PT_TSTRING or $3A17 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_TITLE}{$EndIf C3}
  PR_TITLE_W                                  = PT_UNICODE or $3A17 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_TITLE_W}{$EndIf C3}
  PR_TITLE_A                                  = PT_STRING8 or $3A17 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_TITLE_A}{$EndIf C3}
  PR_DEPARTMENT_NAME                          = PT_TSTRING or $3A18 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_DEPARTMENT_NAME}{$EndIf C3}
  PR_DEPARTMENT_NAME_W                        = PT_UNICODE or $3A18 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_DEPARTMENT_NAME_W}{$EndIf C3}
  PR_DEPARTMENT_NAME_A                        = PT_STRING8 or $3A18 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_DEPARTMENT_NAME_A}{$EndIf C3}
  PR_OFFICE_LOCATION                          = PT_TSTRING or $3A19 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OFFICE_LOCATION}{$EndIf C3}
  PR_OFFICE_LOCATION_W                        = PT_UNICODE or $3A19 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OFFICE_LOCATION_W}{$EndIf C3}
  PR_OFFICE_LOCATION_A                        = PT_STRING8 or $3A19 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OFFICE_LOCATION_A}{$EndIf C3}
  PR_PRIMARY_TELEPHONE_NUMBER                 = PT_TSTRING or $3A1A shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PRIMARY_TELEPHONE_NUMBER}{$EndIf C3}
  PR_PRIMARY_TELEPHONE_NUMBER_W               = PT_UNICODE or $3A1A shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PRIMARY_TELEPHONE_NUMBER_W}{$EndIf C3}
  PR_PRIMARY_TELEPHONE_NUMBER_A               = PT_STRING8 or $3A1A shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PRIMARY_TELEPHONE_NUMBER_A}{$EndIf C3}
  PR_BUSINESS2_TELEPHONE_NUMBER               = PT_TSTRING or $3A1B shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_BUSINESS2_TELEPHONE_NUMBER}{$EndIf C3}
  PR_BUSINESS2_TELEPHONE_NUMBER_W             = PT_UNICODE or $3A1B shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_BUSINESS2_TELEPHONE_NUMBER_W}{$EndIf C3}
  PR_BUSINESS2_TELEPHONE_NUMBER_A             = PT_STRING8 or $3A1B shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_BUSINESS2_TELEPHONE_NUMBER_A}{$EndIf C3}
  PR_OFFICE2_TELEPHONE_NUMBER                 = PR_BUSINESS2_TELEPHONE_NUMBER;
  {$IfDef C3}{$EXTERNALSYM PR_OFFICE2_TELEPHONE_NUMBER}{$EndIf C3}
  PR_OFFICE2_TELEPHONE_NUMBER_W               = PR_BUSINESS2_TELEPHONE_NUMBER_W;
  {$IfDef C3}{$EXTERNALSYM PR_OFFICE2_TELEPHONE_NUMBER_W}{$EndIf C3}
  PR_OFFICE2_TELEPHONE_NUMBER_A               = PR_BUSINESS2_TELEPHONE_NUMBER_A;
  {$IfDef C3}{$EXTERNALSYM PR_OFFICE2_TELEPHONE_NUMBER_A}{$EndIf C3}
  PR_MOBILE_TELEPHONE_NUMBER                  = PT_TSTRING or $3A1C shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_MOBILE_TELEPHONE_NUMBER}{$EndIf C3}
  PR_MOBILE_TELEPHONE_NUMBER_W                = PT_UNICODE or $3A1C shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_MOBILE_TELEPHONE_NUMBER_W}{$EndIf C3}
  PR_MOBILE_TELEPHONE_NUMBER_A                = PT_STRING8 or $3A1C shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_MOBILE_TELEPHONE_NUMBER_A}{$EndIf C3}
  PR_CELLULAR_TELEPHONE_NUMBER                = PR_MOBILE_TELEPHONE_NUMBER;
  {$IfDef C3}{$EXTERNALSYM PR_CELLULAR_TELEPHONE_NUMBER}{$EndIf C3}
  PR_CELLULAR_TELEPHONE_NUMBER_W              = PR_MOBILE_TELEPHONE_NUMBER_W;
  {$IfDef C3}{$EXTERNALSYM PR_CELLULAR_TELEPHONE_NUMBER_W}{$EndIf C3}
  PR_CELLULAR_TELEPHONE_NUMBER_A              = PR_MOBILE_TELEPHONE_NUMBER_A;
  {$IfDef C3}{$EXTERNALSYM PR_CELLULAR_TELEPHONE_NUMBER_A}{$EndIf C3}
  PR_RADIO_TELEPHONE_NUMBER                   = PT_TSTRING or $3A1D shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_RADIO_TELEPHONE_NUMBER}{$EndIf C3}
  PR_RADIO_TELEPHONE_NUMBER_W                 = PT_UNICODE or $3A1D shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_RADIO_TELEPHONE_NUMBER_W}{$EndIf C3}
  PR_RADIO_TELEPHONE_NUMBER_A                 = PT_STRING8 or $3A1D shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_RADIO_TELEPHONE_NUMBER_A}{$EndIf C3}
  PR_CAR_TELEPHONE_NUMBER                     = PT_TSTRING or $3A1E shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CAR_TELEPHONE_NUMBER}{$EndIf C3}
  PR_CAR_TELEPHONE_NUMBER_W                   = PT_UNICODE or $3A1E shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CAR_TELEPHONE_NUMBER_W}{$EndIf C3}
  PR_CAR_TELEPHONE_NUMBER_A                   = PT_STRING8 or $3A1E shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CAR_TELEPHONE_NUMBER_A}{$EndIf C3}
  PR_OTHER_TELEPHONE_NUMBER                   = PT_TSTRING or $3A1F shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OTHER_TELEPHONE_NUMBER}{$EndIf C3}
  PR_OTHER_TELEPHONE_NUMBER_W                 = PT_UNICODE or $3A1F shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OTHER_TELEPHONE_NUMBER_W}{$EndIf C3}
  PR_OTHER_TELEPHONE_NUMBER_A                 = PT_STRING8 or $3A1F shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OTHER_TELEPHONE_NUMBER_A}{$EndIf C3}
  PR_TRANSMITABLE_DISPLAY_NAME                = PT_TSTRING or $3A20 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_TRANSMITABLE_DISPLAY_NAME}{$EndIf C3}
  PR_TRANSMITABLE_DISPLAY_NAME_W              = PT_UNICODE or $3A20 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_TRANSMITABLE_DISPLAY_NAME_W}{$EndIf C3}
  PR_TRANSMITABLE_DISPLAY_NAME_A              = PT_STRING8 or $3A20 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_TRANSMITABLE_DISPLAY_NAME_A}{$EndIf C3}
  PR_PAGER_TELEPHONE_NUMBER                   = PT_TSTRING or $3A21 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PAGER_TELEPHONE_NUMBER}{$EndIf C3}
  PR_PAGER_TELEPHONE_NUMBER_W                 = PT_UNICODE or $3A21 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PAGER_TELEPHONE_NUMBER_W}{$EndIf C3}
  PR_PAGER_TELEPHONE_NUMBER_A                 = PT_STRING8 or $3A21 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PAGER_TELEPHONE_NUMBER_A}{$EndIf C3}
  PR_BEEPER_TELEPHONE_NUMBER                  = PR_PAGER_TELEPHONE_NUMBER;
  {$IfDef C3}{$EXTERNALSYM PR_BEEPER_TELEPHONE_NUMBER}{$EndIf C3}
  PR_BEEPER_TELEPHONE_NUMBER_W                = PR_PAGER_TELEPHONE_NUMBER_W;
  {$IfDef C3}{$EXTERNALSYM PR_BEEPER_TELEPHONE_NUMBER_W}{$EndIf C3}
  PR_BEEPER_TELEPHONE_NUMBER_A                = PR_PAGER_TELEPHONE_NUMBER_A;
  {$IfDef C3}{$EXTERNALSYM PR_BEEPER_TELEPHONE_NUMBER_A}{$EndIf C3}
  PR_USER_CERTIFICATE                         = PT_BINARY or $3A22 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_USER_CERTIFICATE}{$EndIf C3}
  PR_PRIMARY_FAX_NUMBER                       = PT_TSTRING or $3A23 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PRIMARY_FAX_NUMBER}{$EndIf C3}
  PR_PRIMARY_FAX_NUMBER_W                     = PT_UNICODE or $3A23 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PRIMARY_FAX_NUMBER_W}{$EndIf C3}
  PR_PRIMARY_FAX_NUMBER_A                     = PT_STRING8 or $3A23 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PRIMARY_FAX_NUMBER_A}{$EndIf C3}
  PR_BUSINESS_FAX_NUMBER                      = PT_TSTRING or $3A24 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_BUSINESS_FAX_NUMBER}{$EndIf C3}
  PR_BUSINESS_FAX_NUMBER_W                    = PT_UNICODE or $3A24 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_BUSINESS_FAX_NUMBER_W}{$EndIf C3}
  PR_BUSINESS_FAX_NUMBER_A                    = PT_STRING8 or $3A24 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_BUSINESS_FAX_NUMBER_A}{$EndIf C3}
  PR_HOME_FAX_NUMBER                          = PT_TSTRING or $3A25 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_FAX_NUMBER}{$EndIf C3}
  PR_HOME_FAX_NUMBER_W                        = PT_UNICODE or $3A25 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_FAX_NUMBER_W}{$EndIf C3}
  PR_HOME_FAX_NUMBER_A                        = PT_STRING8 or $3A25 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_FAX_NUMBER_A}{$EndIf C3}
  PR_COUNTRY                                  = PT_TSTRING or $3A26 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_COUNTRY}{$EndIf C3}
  PR_COUNTRY_W                                = PT_UNICODE or $3A26 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_COUNTRY_W}{$EndIf C3}
  PR_COUNTRY_A                                = PT_STRING8 or $3A26 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_COUNTRY_A}{$EndIf C3}
  PR_LOCALITY                                 = PT_TSTRING or $3A27 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_LOCALITY}{$EndIf C3}
  PR_LOCALITY_W                               = PT_UNICODE or $3A27 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_LOCALITY_W}{$EndIf C3}
  PR_LOCALITY_A                               = PT_STRING8 or $3A27 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_LOCALITY_A}{$EndIf C3}
  PR_STATE_OR_PROVINCE                        = PT_TSTRING or $3A28 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_STATE_OR_PROVINCE}{$EndIf C3}
  PR_STATE_OR_PROVINCE_W                      = PT_UNICODE or $3A28 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_STATE_OR_PROVINCE_W}{$EndIf C3}
  PR_STATE_OR_PROVINCE_A                      = PT_STRING8 or $3A28 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_STATE_OR_PROVINCE_A}{$EndIf C3}
  PR_STREET_ADDRESS                           = PT_TSTRING or $3A29 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_STREET_ADDRESS}{$EndIf C3}
  PR_STREET_ADDRESS_W                         = PT_UNICODE or $3A29 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_STREET_ADDRESS_W}{$EndIf C3}
  PR_STREET_ADDRESS_A                         = PT_STRING8 or $3A29 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_STREET_ADDRESS_A}{$EndIf C3}
  PR_POSTAL_CODE                              = PT_TSTRING or $3A2A shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_POSTAL_CODE}{$EndIf C3}
  PR_POSTAL_CODE_W                            = PT_UNICODE or $3A2A shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_POSTAL_CODE_W}{$EndIf C3}
  PR_POSTAL_CODE_A                            = PT_STRING8 or $3A2A shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_POSTAL_CODE_A}{$EndIf C3}
  PR_POST_OFFICE_BOX                          = PT_TSTRING or $3A2B shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_POST_OFFICE_BOX}{$EndIf C3}
  PR_POST_OFFICE_BOX_W                        = PT_UNICODE or $3A2B shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_POST_OFFICE_BOX_W}{$EndIf C3}
  PR_POST_OFFICE_BOX_A                        = PT_STRING8 or $3A2B shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_POST_OFFICE_BOX_A}{$EndIf C3}
  PR_BUSINESS_ADDRESS_POST_OFFICE_BOX         = PR_POST_OFFICE_BOX;
  {$IfDef C3}{$EXTERNALSYM PR_BUSINESS_ADDRESS_POST_OFFICE_BOX}{$EndIf C3}
  PR_BUSINESS_ADDRESS_POST_OFFICE_BOX_W       = PR_POST_OFFICE_BOX_W;
  {$IfDef C3}{$EXTERNALSYM PR_BUSINESS_ADDRESS_POST_OFFICE_BOX_W}{$EndIf C3}
  PR_BUSINESS_ADDRESS_POST_OFFICE_BOX_A       = PR_POST_OFFICE_BOX_A;
  {$IfDef C3}{$EXTERNALSYM PR_BUSINESS_ADDRESS_POST_OFFICE_BOX_A}{$EndIf C3}
  PR_TELEX_NUMBER                             = PT_TSTRING or $3A2C shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_TELEX_NUMBER}{$EndIf C3}
  PR_TELEX_NUMBER_W                           = PT_UNICODE or $3A2C shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_TELEX_NUMBER_W}{$EndIf C3}
  PR_TELEX_NUMBER_A                           = PT_STRING8 or $3A2C shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_TELEX_NUMBER_A}{$EndIf C3}
  PR_ISDN_NUMBER                              = PT_TSTRING or $3A2D shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ISDN_NUMBER}{$EndIf C3}
  PR_ISDN_NUMBER_W                            = PT_UNICODE or $3A2D shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ISDN_NUMBER_W}{$EndIf C3}
  PR_ISDN_NUMBER_A                            = PT_STRING8 or $3A2D shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ISDN_NUMBER_A}{$EndIf C3}
  PR_ASSISTANT_TELEPHONE_NUMBER               = PT_TSTRING or $3A2E shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ASSISTANT_TELEPHONE_NUMBER}{$EndIf C3}
  PR_ASSISTANT_TELEPHONE_NUMBER_W             = PT_UNICODE or $3A2E shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ASSISTANT_TELEPHONE_NUMBER_W}{$EndIf C3}
  PR_ASSISTANT_TELEPHONE_NUMBER_A             = PT_STRING8 or $3A2E shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ASSISTANT_TELEPHONE_NUMBER_A}{$EndIf C3}
  PR_HOME2_TELEPHONE_NUMBER                   = PT_TSTRING or $3A2F shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME2_TELEPHONE_NUMBER}{$EndIf C3}
  PR_HOME2_TELEPHONE_NUMBER_W                 = PT_UNICODE or $3A2F shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME2_TELEPHONE_NUMBER_W}{$EndIf C3}
  PR_HOME2_TELEPHONE_NUMBER_A                 = PT_STRING8 or $3A2F shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME2_TELEPHONE_NUMBER_A}{$EndIf C3}
  PR_ASSISTANT                                = PT_TSTRING or $3A30 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ASSISTANT}{$EndIf C3}
  PR_ASSISTANT_W                              = PT_UNICODE or $3A30 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ASSISTANT_W}{$EndIf C3}
  PR_ASSISTANT_A                              = PT_STRING8 or $3A30 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_ASSISTANT_A}{$EndIf C3}
  PR_SEND_RICH_INFO                           = PT_BOOLEAN or $3A40 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_SEND_RICH_INFO}{$EndIf C3}
  PR_WEDDING_ANNIVERSARY                      = PT_SYSTIME or $3A41 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_WEDDING_ANNIVERSARY}{$EndIf C3}
  PR_BIRTHDAY                                 = PT_SYSTIME or $3A42 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_BIRTHDAY}{$EndIf C3}
  PR_HOBBIES                                  = PT_TSTRING or $3A43 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOBBIES}{$EndIf C3}
  PR_HOBBIES_W                                = PT_UNICODE or $3A43 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOBBIES_W}{$EndIf C3}
  PR_HOBBIES_A                                = PT_STRING8 or $3A43 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOBBIES_A}{$EndIf C3}
  PR_MIDDLE_NAME                              = PT_TSTRING or $3A44 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_MIDDLE_NAME}{$EndIf C3}
  PR_MIDDLE_NAME_W                            = PT_UNICODE or $3A44 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_MIDDLE_NAME_W}{$EndIf C3}
  PR_MIDDLE_NAME_A                            = PT_STRING8 or $3A44 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_MIDDLE_NAME_A}{$EndIf C3}
  PR_DISPLAY_NAME_PREFIX                      = PT_TSTRING or $3A45 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_DISPLAY_NAME_PREFIX}{$EndIf C3}
  PR_DISPLAY_NAME_PREFIX_W                    = PT_UNICODE or $3A45 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_DISPLAY_NAME_PREFIX_W}{$EndIf C3}
  PR_DISPLAY_NAME_PREFIX_A                    = PT_STRING8 or $3A45 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_DISPLAY_NAME_PREFIX_A}{$EndIf C3}
  PR_PROFESSION                               = PT_TSTRING or $3A46 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PROFESSION}{$EndIf C3}
  PR_PROFESSION_W                             = PT_UNICODE or $3A46 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PROFESSION_W}{$EndIf C3}
  PR_PROFESSION_A                             = PT_STRING8 or $3A46 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PROFESSION_A}{$EndIf C3}
  PR_PREFERRED_BY_NAME                        = PT_TSTRING or $3A47 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PREFERRED_BY_NAME}{$EndIf C3}
  PR_PREFERRED_BY_NAME_W                      = PT_UNICODE or $3A47 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PREFERRED_BY_NAME_W}{$EndIf C3}
  PR_PREFERRED_BY_NAME_A                      = PT_STRING8 or $3A47 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PREFERRED_BY_NAME_A}{$EndIf C3}
  PR_SPOUSE_NAME                              = PT_TSTRING or $3A48 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_SPOUSE_NAME}{$EndIf C3}
  PR_SPOUSE_NAME_W                            = PT_UNICODE or $3A48 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_SPOUSE_NAME_W}{$EndIf C3}
  PR_SPOUSE_NAME_A                            = PT_STRING8 or $3A48 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_SPOUSE_NAME_A}{$EndIf C3}
  PR_COMPUTER_NETWORK_NAME                    = PT_TSTRING or $3A49 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_COMPUTER_NETWORK_NAME}{$EndIf C3}
  PR_COMPUTER_NETWORK_NAME_W                  = PT_UNICODE or $3A49 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_COMPUTER_NETWORK_NAME_W}{$EndIf C3}
  PR_COMPUTER_NETWORK_NAME_A                  = PT_STRING8 or $3A49 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_COMPUTER_NETWORK_NAME_A}{$EndIf C3}
  PR_CUSTOMER_ID                              = PT_TSTRING or $3A4A shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CUSTOMER_ID}{$EndIf C3}
  PR_CUSTOMER_ID_W                            = PT_UNICODE or $3A4A shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CUSTOMER_ID_W}{$EndIf C3}
  PR_CUSTOMER_ID_A                            = PT_STRING8 or $3A4A shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CUSTOMER_ID_A}{$EndIf C3}
  PR_TTYTDD_PHONE_NUMBER                      = PT_TSTRING or $3A4B shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_TTYTDD_PHONE_NUMBER}{$EndIf C3}
  PR_TTYTDD_PHONE_NUMBER_W                    = PT_UNICODE or $3A4B shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_TTYTDD_PHONE_NUMBER_W}{$EndIf C3}
  PR_TTYTDD_PHONE_NUMBER_A                    = PT_STRING8 or $3A4B shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_TTYTDD_PHONE_NUMBER_A}{$EndIf C3}
  PR_FTP_SITE                                 = PT_TSTRING or $3A4C shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_FTP_SITE}{$EndIf C3}
  PR_FTP_SITE_W                               = PT_UNICODE or $3A4C shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_FTP_SITE_W}{$EndIf C3}
  PR_FTP_SITE_A                               = PT_STRING8 or $3A4C shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_FTP_SITE_A}{$EndIf C3}
  PR_GENDER                                   = PT_SHORT or $3A4D shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_GENDER}{$EndIf C3}
  PR_MANAGER_NAME                             = PT_TSTRING or $3A4E shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_MANAGER_NAME}{$EndIf C3}
  PR_MANAGER_NAME_W                           = PT_UNICODE or $3A4E shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_MANAGER_NAME_W}{$EndIf C3}
  PR_MANAGER_NAME_A                           = PT_STRING8 or $3A4E shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_MANAGER_NAME_A}{$EndIf C3}
  PR_NICKNAME                                 = PT_TSTRING or $3A4F shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_NICKNAME}{$EndIf C3}
  PR_NICKNAME_W                               = PT_UNICODE or $3A4F shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_NICKNAME_W}{$EndIf C3}
  PR_NICKNAME_A                               = PT_STRING8 or $3A4F shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_NICKNAME_A}{$EndIf C3}
  PR_PERSONAL_HOME_PAGE                       = PT_TSTRING or $3A50 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PERSONAL_HOME_PAGE}{$EndIf C3}
  PR_PERSONAL_HOME_PAGE_W                     = PT_UNICODE or $3A50 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PERSONAL_HOME_PAGE_W}{$EndIf C3}
  PR_PERSONAL_HOME_PAGE_A                     = PT_STRING8 or $3A50 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_PERSONAL_HOME_PAGE_A}{$EndIf C3}
  PR_BUSINESS_HOME_PAGE                       = PT_TSTRING or $3A51 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_BUSINESS_HOME_PAGE}{$EndIf C3}
  PR_BUSINESS_HOME_PAGE_W                     = PT_UNICODE or $3A51 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_BUSINESS_HOME_PAGE_W}{$EndIf C3}
  PR_BUSINESS_HOME_PAGE_A                     = PT_STRING8 or $3A51 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_BUSINESS_HOME_PAGE_A}{$EndIf C3}
  PR_CONTACT_VERSION                          = PT_CLSID or $3A52 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CONTACT_VERSION}{$EndIf C3}
  PR_CONTACT_ENTRYIDS                         = PT_MV_BINARY or $3A53 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CONTACT_ENTRYIDS}{$EndIf C3}
  PR_CONTACT_ADDRTYPES                        = PT_MV_TSTRING or $3A54 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CONTACT_ADDRTYPES}{$EndIf C3}
  PR_CONTACT_ADDRTYPES_W                      = PT_MV_UNICODE or $3A54 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CONTACT_ADDRTYPES_W}{$EndIf C3}
  PR_CONTACT_ADDRTYPES_A                      = PT_MV_STRING8 or $3A54 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CONTACT_ADDRTYPES_A}{$EndIf C3}
  PR_CONTACT_DEFAULT_ADDRESS_INDEX            = PT_LONG or $3A55 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CONTACT_DEFAULT_ADDRESS_INDEX}{$EndIf C3}
  PR_CONTACT_EMAIL_ADDRESSES                  = PT_MV_TSTRING or $3A56 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CONTACT_EMAIL_ADDRESSES}{$EndIf C3}
  PR_CONTACT_EMAIL_ADDRESSES_W                = PT_MV_UNICODE or $3A56 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CONTACT_EMAIL_ADDRESSES_W}{$EndIf C3}
  PR_CONTACT_EMAIL_ADDRESSES_A                = PT_MV_STRING8 or $3A56 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CONTACT_EMAIL_ADDRESSES_A}{$EndIf C3}
  PR_COMPANY_MAIN_PHONE_NUMBER                = PT_TSTRING or $3A57 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_COMPANY_MAIN_PHONE_NUMBER}{$EndIf C3}
  PR_COMPANY_MAIN_PHONE_NUMBER_W              = PT_UNICODE or $3A57 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_COMPANY_MAIN_PHONE_NUMBER_W}{$EndIf C3}
  PR_COMPANY_MAIN_PHONE_NUMBER_A              = PT_STRING8 or $3A57 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_COMPANY_MAIN_PHONE_NUMBER_A}{$EndIf C3}
  PR_CHILDRENS_NAMES                          = PT_MV_TSTRING or $3A58 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CHILDRENS_NAMES}{$EndIf C3}
  PR_CHILDRENS_NAMES_W                        = PT_MV_UNICODE or $3A58 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CHILDRENS_NAMES_W}{$EndIf C3}
  PR_CHILDRENS_NAMES_A                        = PT_MV_STRING8 or $3A58 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_CHILDRENS_NAMES_A}{$EndIf C3}
  PR_HOME_ADDRESS_CITY                        = PT_TSTRING or $3A59 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_ADDRESS_CITY}{$EndIf C3}
  PR_HOME_ADDRESS_CITY_W                      = PT_UNICODE or $3A59 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_ADDRESS_CITY_W}{$EndIf C3}
  PR_HOME_ADDRESS_CITY_A                      = PT_STRING8 or $3A59 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_ADDRESS_CITY_A}{$EndIf C3}
  PR_HOME_ADDRESS_COUNTRY                     = PT_TSTRING or $3A5A shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_ADDRESS_COUNTRY}{$EndIf C3}
  PR_HOME_ADDRESS_COUNTRY_W                   = PT_UNICODE or $3A5A shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_ADDRESS_COUNTRY_W}{$EndIf C3}
  PR_HOME_ADDRESS_COUNTRY_A                   = PT_STRING8 or $3A5A shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_ADDRESS_COUNTRY_A}{$EndIf C3}
  PR_HOME_ADDRESS_POSTAL_CODE                 = PT_TSTRING or $3A5B shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_ADDRESS_POSTAL_CODE}{$EndIf C3}
  PR_HOME_ADDRESS_POSTAL_CODE_W               = PT_UNICODE or $3A5B shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_ADDRESS_POSTAL_CODE_W}{$EndIf C3}
  PR_HOME_ADDRESS_POSTAL_CODE_A               = PT_STRING8 or $3A5B shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_ADDRESS_POSTAL_CODE_A}{$EndIf C3}
  PR_HOME_ADDRESS_STATE_OR_PROVINCE           = PT_TSTRING or $3A5C shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_ADDRESS_STATE_OR_PROVINCE}{$EndIf C3}
  PR_HOME_ADDRESS_STATE_OR_PROVINCE_W         = PT_UNICODE or $3A5C shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_ADDRESS_STATE_OR_PROVINCE_W}{$EndIf C3}
  PR_HOME_ADDRESS_STATE_OR_PROVINCE_A         = PT_STRING8 or $3A5C shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_ADDRESS_STATE_OR_PROVINCE_A}{$EndIf C3}
  PR_HOME_ADDRESS_STREET                      = PT_TSTRING or $3A5D shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_ADDRESS_STREET}{$EndIf C3}
  PR_HOME_ADDRESS_STREET_W                    = PT_UNICODE or $3A5D shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_ADDRESS_STREET_W}{$EndIf C3}
  PR_HOME_ADDRESS_STREET_A                    = PT_STRING8 or $3A5D shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_ADDRESS_STREET_A}{$EndIf C3}
  PR_HOME_ADDRESS_POST_OFFICE_BOX             = PT_TSTRING or $3A5E shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_ADDRESS_POST_OFFICE_BOX}{$EndIf C3}
  PR_HOME_ADDRESS_POST_OFFICE_BOX_W           = PT_UNICODE or $3A5E shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_ADDRESS_POST_OFFICE_BOX_W}{$EndIf C3}
  PR_HOME_ADDRESS_POST_OFFICE_BOX_A           = PT_STRING8 or $3A5E shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_HOME_ADDRESS_POST_OFFICE_BOX_A}{$EndIf C3}
  PR_OTHER_ADDRESS_CITY                       = PT_TSTRING or $3A5F shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OTHER_ADDRESS_CITY}{$EndIf C3}
  PR_OTHER_ADDRESS_CITY_W                     = PT_UNICODE or $3A5F shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OTHER_ADDRESS_CITY_W}{$EndIf C3}
  PR_OTHER_ADDRESS_CITY_A                     = PT_STRING8 or $3A5F shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OTHER_ADDRESS_CITY_A}{$EndIf C3}
  PR_OTHER_ADDRESS_COUNTRY                    = PT_TSTRING or $3A60 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OTHER_ADDRESS_COUNTRY}{$EndIf C3}
  PR_OTHER_ADDRESS_COUNTRY_W                  = PT_UNICODE or $3A60 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OTHER_ADDRESS_COUNTRY_W}{$EndIf C3}
  PR_OTHER_ADDRESS_COUNTRY_A                  = PT_STRING8 or $3A60 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OTHER_ADDRESS_COUNTRY_A}{$EndIf C3}
  PR_OTHER_ADDRESS_POSTAL_CODE                = PT_TSTRING or $3A61 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OTHER_ADDRESS_POSTAL_CODE}{$EndIf C3}
  PR_OTHER_ADDRESS_POSTAL_CODE_W              = PT_UNICODE or $3A61 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OTHER_ADDRESS_POSTAL_CODE_W}{$EndIf C3}
  PR_OTHER_ADDRESS_POSTAL_CODE_A              = PT_STRING8 or $3A61 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OTHER_ADDRESS_POSTAL_CODE_A}{$EndIf C3}
  PR_OTHER_ADDRESS_STATE_OR_PROVINCE          = PT_TSTRING or $3A62 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OTHER_ADDRESS_STATE_OR_PROVINCE}{$EndIf C3}
  PR_OTHER_ADDRESS_STATE_OR_PROVINCE_W        = PT_UNICODE or $3A62 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OTHER_ADDRESS_STATE_OR_PROVINCE_W}{$EndIf C3}
  PR_OTHER_ADDRESS_STATE_OR_PROVINCE_A        = PT_STRING8 or $3A62 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OTHER_ADDRESS_STATE_OR_PROVINCE_A}{$EndIf C3}
  PR_OTHER_ADDRESS_STREET                     = PT_TSTRING or $3A63 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OTHER_ADDRESS_STREET}{$EndIf C3}
  PR_OTHER_ADDRESS_STREET_W                   = PT_UNICODE or $3A63 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OTHER_ADDRESS_STREET_W}{$EndIf C3}
  PR_OTHER_ADDRESS_STREET_A                   = PT_STRING8 or $3A63 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OTHER_ADDRESS_STREET_A}{$EndIf C3}
  PR_OTHER_ADDRESS_POST_OFFICE_BOX            = PT_TSTRING or $3A64 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OTHER_ADDRESS_POST_OFFICE_BOX}{$EndIf C3}
  PR_OTHER_ADDRESS_POST_OFFICE_BOX_W          = PT_UNICODE or $3A64 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OTHER_ADDRESS_POST_OFFICE_BOX_W}{$EndIf C3}
  PR_OTHER_ADDRESS_POST_OFFICE_BOX_A          = PT_STRING8 or $3A64 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_OTHER_ADDRESS_POST_OFFICE_BOX_A}{$EndIf C3}
  PR_USER_X509_CERTIFICATE                    = PT_MV_BINARY or $3A70 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_USER_X509_CERTIFICATE}{$EndIf C3}
  PR_SEND_INTERNET_ENCODING                   = PT_LONG or $3A71 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_SEND_INTERNET_ENCODING}{$EndIf C3}

  PR_BUSINESS_ADDRESS_CITY                    = PR_LOCALITY;
  {$IfDef C3}{$EXTERNALSYM PR_BUSINESS_ADDRESS_CITY}{$EndIf C3}
  PR_BUSINESS_ADDRESS_COUNTRY                 = PR_COUNTRY;
  {$IfDef C3}{$EXTERNALSYM PR_BUSINESS_ADDRESS_COUNTRY}{$EndIf C3}
  PR_BUSINESS_ADDRESS_POSTAL_CODE             = PR_POSTAL_CODE;
  {$IfDef C3}{$EXTERNALSYM PR_BUSINESS_ADDRESS_POSTAL_CODE}{$EndIf C3}
  PR_BUSINESS_ADDRESS_STATE_OR_PROVINCE       = PR_STATE_OR_PROVINCE;
  {$IfDef C3}{$EXTERNALSYM PR_BUSINESS_ADDRESS_STATE_OR_PROVINCE}{$EndIf C3}
  PR_BUSINESS_ADDRESS_STREET                  = PR_STREET_ADDRESS;
  {$IfDef C3}{$EXTERNALSYM PR_BUSINESS_ADDRESS_STREET}{$EndIf C3}

{ Message recipient properties }

  PR_RECIPIENT_TYPE                           = PT_LONG or $0C15 shl 16;
  {$IfDef C3}{$EXTERNALSYM PR_RECIPIENT_TYPE}{$EndIf C3}

{ Secure property id range }

  PROP_ID_SECURE_MIN                          = $67F0;
  {$IfDef C3}{$EXTERNALSYM PROP_ID_SECURE_MIN}{$EndIf C3}
  PROP_ID_SECURE_MAX                          = $67FF;
  {$IfDef C3}{$EXTERNALSYM PROP_ID_SECURE_MAX}{$EndIf C3}

{ These are the bits that show up in PR_SEND_INTERNET_ENCODING }

{ whether or not an encoding preference is specified
   1 - pay attention to the rest of the bits for the encoding preferences
   0 - let the mail system choose what's best for it }

  ENCODING_PREFERENCE                     = ULONG($00020000);
  {$IfDef C3}{$EXTERNALSYM ENCODING_PREFERENCE}{$EndIf C3}

{  1 - message in MIME;
   0 - plain text/uuencode attachments }

  ENCODING_TEXT                           = ULONG($00000000);
  {$IfDef C3}{$EXTERNALSYM ENCODING_TEXT}{$EndIf C3}
  ENCODING_MIME                           = ULONG($00040000);
  {$IfDef C3}{$EXTERNALSYM ENCODING_MIME}{$EndIf C3}

{ Specifies how the body of the message is encoded.
    00 - Body encoded as text
    01 - body encoded as HTML (only valid if message in MIME)
    10 - (actualy 1X) Text and HTML as multipart alternative (only valid if
         message in MIME)
}

  BODY_ENCODING_MASK                      = ULONG($00180000);
  {$IfDef C3}{$EXTERNALSYM BODY_ENCODING_MASK}{$EndIf C3}
  BODY_ENCODING_TEXT                      = ULONG($00000000);  // for completeness
  {$IfDef C3}{$EXTERNALSYM BODY_ENCODING_TEXT}{$EndIf C3}
  BODY_ENCODING_HTML                      = ULONG($00080000);
  {$IfDef C3}{$EXTERNALSYM BODY_ENCODING_HTML}{$EndIf C3}
  BODY_ENCODING_TEXT_AND_HTML             = ULONG($00100000);
  {$IfDef C3}{$EXTERNALSYM BODY_ENCODING_TEXT_AND_HTML}{$EndIf C3}

{ Specifies how to handle Mac attachments
    00 - BinHex
    01 - UUENCODED (not valid if message in MIME - will be ignored, BinHex used instead)
    10 - Apple Single (only valid if message in MIME)
    11 - Apple Double (only valid if message in MIME)
}

  MAC_ATTACH_ENCODING_MASK                = ULONG($00600000);
  {$IfDef C3}{$EXTERNALSYM MAC_ATTACH_ENCODING_MASK}{$EndIf C3}
  MAC_ATTACH_ENCODING_BINHEX              = ULONG($00000000);
  {$IfDef C3}{$EXTERNALSYM MAC_ATTACH_ENCODING_BINHEX}{$EndIf C3}
  MAC_ATTACH_ENCODING_UUENCODE            = ULONG($00200000);
  {$IfDef C3}{$EXTERNALSYM MAC_ATTACH_ENCODING_UUENCODE}{$EndIf C3}
  MAC_ATTACH_ENCODING_APPLESINGLE         = ULONG($00400000);
  {$IfDef C3}{$EXTERNALSYM MAC_ATTACH_ENCODING_APPLESINGLE}{$EndIf C3}
  MAC_ATTACH_ENCODING_APPLEDOUBLE         = ULONG($00600000);
  {$IfDef C3}{$EXTERNALSYM MAC_ATTACH_ENCODING_APPLEDOUBLE}{$EndIf C3}


{ Values for PR_GENDER property }

type
  Gender = DWORD;
  {$IfDef C3}{$EXTERNALSYM Gender}{$EndIf C3}

const
  genderUnspecified = 0;
  genderFemale = 1;
  genderMale = 2;

{******************************************************************************}
implementation
{******************************************************************************}

function FIsTransmittable(ulPropTag: ULONG): BOOL;
begin
  Result :=
    ((PROP_ID (ulPropTag) <  $0E00) or
    (PROP_ID (ulPropTag)  >= $8000) or
    ((PROP_ID (ulPropTag) >= $1000) and (PROP_ID (ulPropTag) < $6000)) and
    ((PROP_ID (ulPropTag) >= $6800) and (PROP_ID (ulPropTag) < $7C00)));
end;

end.
