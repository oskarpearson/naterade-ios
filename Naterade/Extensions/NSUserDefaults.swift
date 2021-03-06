//
//  NSUserDefaults.swift
//  Naterade
//
//  Created by Nathan Racklyeft on 8/30/15.
//  Copyright © 2015 Nathan Racklyeft. All rights reserved.
//

import Foundation
import LoopKit


extension NSUserDefaults {

    private enum Key: String {
        case BasalRateSchedule = "com.loudnate.Naterade.BasalRateSchedule"
        case CarbRatioSchedule = "com.loudnate.Naterade.CarbRatioSchedule"
        case ConnectedPeripheralIDs = "com.loudnate.Naterade.ConnectedPeripheralIDs"
        case DosingEnabled = "com.loudnate.Naterade.DosingEnabled"
        case InsulinActionDuration = "com.loudnate.Naterade.InsulinActionDuration"
        case InsulinSensitivitySchedule = "com.loudnate.Naterade.InsulinSensitivitySchedule"
        case GlucoseTargetRangeSchedule = "com.loudnate.Naterade.GlucoseTargetRangeSchedule"
        case MaximumBasalRatePerHour = "com.loudnate.Naterade.MaximumBasalRatePerHour"
        case MaximumBolus = "com.loudnate.Naterade.MaximumBolus"
        case PumpID = "com.loudnate.Naterade.PumpID"
        case PumpTimeZone = "com.loudnate.Naterade.PumpTimeZone"
        case TransmitterID = "com.loudnate.Naterade.TransmitterID"
        case TransmitterStartTime = "com.loudnate.Naterade.TransmitterStartTime"
    }

    var basalRateSchedule: BasalRateSchedule? {
        get {
            if let rawValue = dictionaryForKey(Key.BasalRateSchedule.rawValue) {
                return BasalRateSchedule(rawValue: rawValue)
            } else {
                return nil
            }
        }
        set {
            setObject(newValue?.rawValue, forKey: Key.BasalRateSchedule.rawValue)
        }
    }

    var carbRatioSchedule: CarbRatioSchedule? {
        get {
            if let rawValue = dictionaryForKey(Key.CarbRatioSchedule.rawValue) {
                return CarbRatioSchedule(rawValue: rawValue)
            } else {
                return nil
            }
        }
        set {
            setObject(newValue?.rawValue, forKey: Key.CarbRatioSchedule.rawValue)
        }
    }

    var connectedPeripheralIDs: [String] {
        get {
            return arrayForKey(Key.ConnectedPeripheralIDs.rawValue) as? [String] ?? []
        }
        set {
            setObject(newValue, forKey: Key.ConnectedPeripheralIDs.rawValue)
        }
    }

    var dosingEnabled: Bool {
        get {
            return boolForKey(Key.DosingEnabled.rawValue)
        }
        set {
            setBool(newValue, forKey: Key.DosingEnabled.rawValue)
        }
    }

    var insulinActionDuration: NSTimeInterval? {
        get {
            let value = doubleForKey(Key.InsulinActionDuration.rawValue)

            return value > 0 ? value : nil
        }
        set {
            if let insulinActionDuration = newValue {
                setDouble(insulinActionDuration, forKey: Key.InsulinActionDuration.rawValue)
            } else {
                removeObjectForKey(Key.InsulinActionDuration.rawValue)
            }
        }
    }

    var insulinSensitivitySchedule: InsulinSensitivitySchedule? {
        get {
            if let rawValue = dictionaryForKey(Key.InsulinSensitivitySchedule.rawValue) {
                return InsulinSensitivitySchedule(rawValue: rawValue)
            } else {
                return nil
            }
        }
        set {
            setObject(newValue?.rawValue, forKey: Key.InsulinSensitivitySchedule.rawValue)
        }
    }

    var glucoseTargetRangeSchedule: GlucoseRangeSchedule? {
        get {
            if let rawValue = dictionaryForKey(Key.GlucoseTargetRangeSchedule.rawValue) {
                return GlucoseRangeSchedule(rawValue: rawValue)
            } else {
                return nil
            }
        }
        set {
            setObject(newValue?.rawValue, forKey: Key.GlucoseTargetRangeSchedule.rawValue)
        }
    }

    var maximumBasalRatePerHour: Double? {
        get {
            let value = doubleForKey(Key.MaximumBasalRatePerHour.rawValue)

            return value > 0 ? value : nil
        }
        set {
            if let maximumBasalRatePerHour = newValue {
                setDouble(maximumBasalRatePerHour, forKey: Key.MaximumBasalRatePerHour.rawValue)
            } else {
                removeObjectForKey(Key.MaximumBasalRatePerHour.rawValue)
            }
        }
    }

    var maximumBolus: Double? {
        get {
            let value = doubleForKey(Key.MaximumBolus.rawValue)

            return value > 0 ? value : nil
        }
        set {
            if let maximumBolus = newValue {
                setDouble(maximumBolus, forKey: Key.MaximumBolus.rawValue)
            } else {
                removeObjectForKey(Key.MaximumBolus.rawValue)
            }
        }
    }

    var pumpID: String? {
        get {
            return stringForKey(Key.PumpID.rawValue)
        }
        set {
            setObject(newValue, forKey: Key.PumpID.rawValue)
        }
    }

    var pumpTimeZone: NSTimeZone? {
        get {
            if let offset = objectForKey(Key.PumpTimeZone.rawValue) as? NSNumber {
                return NSTimeZone(forSecondsFromGMT: offset.integerValue)
            } else {
                return nil
            }
        } set {
            if let value = newValue {
                setObject(NSNumber(integer: value.secondsFromGMT), forKey: Key.PumpTimeZone.rawValue)
            } else {
                removeObjectForKey(Key.PumpTimeZone.rawValue)
            }
        }
    }

    var transmitterStartTime: NSTimeInterval? {
        get {
            let value = doubleForKey(Key.TransmitterStartTime.rawValue)

            return value > 0 ? value : nil
        }
        set {
            if let value = newValue {
                setDouble(value, forKey: Key.TransmitterStartTime.rawValue)
            } else {
                removeObjectForKey(Key.TransmitterStartTime.rawValue)
            }
        }
    }

    var transmitterID: String? {
        get {
            return stringForKey(Key.TransmitterID.rawValue)
        }
        set {
            setObject(newValue, forKey: Key.TransmitterID.rawValue)
        }
    }

}