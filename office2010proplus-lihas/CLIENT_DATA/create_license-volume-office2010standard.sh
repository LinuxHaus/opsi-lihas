#!/bin/bash 
PRODUCT_ID=office2010standard
echo "$PRODUCT_ID"

#############

# here the script starts

# delete the existing license pool and all connected licenses
# ATTENTION: never (!) do this on a productive system
echo "deleteLicensePool $PRODUCT_ID"
opsi-admin -d method deleteLicensePool "$PRODUCT_ID" true

# delete the existing license contract
echo "deleteLicenseContract $PRODUCT_ID"
opsi-admin -d method deleteLicenseContract "$PRODUCT_ID"

# create the new license pool
# the used method has the following syntax:
# createLicensePool(*licensePoolId, *description, *productIds, *windowsSoftwareIds)
echo "createLicensePool $PRODUCT_ID"
opsi-admin -d method createLicensePool "$PRODUCT_ID" "Microsoft Office Standard 2010 deutsch" \'['"'$PRODUCT_ID'"']\' \'['"'$PRODUCT_ID'"']\'

# create the new license contract
# the used method has the following syntax:
# createLicenseContract(*licenseContractId, *partner, *conclusionDate, *notificationDate, *expirationDate, *notes)
echo "createLicenseContract $PRODUCT_ID"
opsi-admin -d method createLicenseContract "$PRODUCT_ID" "company name" "" "" "" ""

# create the new license and add the key(s)
# the used methods have the following syntax:
# createSoftwareLicense(*softwareLicenseId, *licenseContractId, *licenseType, *maxInstallations, *boundToHost, *expirationDate)
# addSoftwareLicenseToLicensePool(softwareLicenseId, licensePoolId, *licenseKey)

# create the volume license:
echo "createSoftwareLicense with key: ${PRODUCT_ID}-vol-key"
MYLIC=`opsi-admin -dS method createSoftwareLicense "l_$PRODUCT_ID" "$PRODUCT_ID" "VOLUME" "0" "" ""`
#opsi-admin -d method addSoftwareLicenseToLicensePool "$MYLIC" "$PRODUCT_ID" "${PRODUCT_ID}-vol-key"
opsi-admin -d method addSoftwareLicenseToLicensePool "$MYLIC" "$PRODUCT_ID" "XXXXXXXXXXXXXXXXXXXXXXXXX"

