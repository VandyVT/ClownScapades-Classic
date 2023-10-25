using System;
using System.Runtime.CompilerServices;
using UnityEngine;

// Token: 0x02000011 RID: 17
public class PickRangeChanger : MonoBehaviour
{
	// Token: 0x06000046 RID: 70 RVA: 0x00002188 File Offset: 0x00000388

	// Token: 0x06000047 RID: 71 RVA: 0x00002DC8 File Offset: 0x00000FC8
	private void Update()
	{
		Vector3 vector = this.player.position - base.transform.position;
		if (!this.equipped && vector.magnitude <= this.pickUpRange && Input.GetKeyDown(KeyCode.E) && !PickRangeChanger.slotFull)
		{
			this.PickUp();
		}
	}

	// Token: 0x06000048 RID: 72 RVA: 0x00002E1E File Offset: 0x0000101E
	private void PickUp()
	{
		PickRangeChanger.slotFull = true;
		this.firstScript.pickUpRange = 2f;
	}

	// Token: 0x0600004A RID: 74 RVA: 0x00002E36 File Offset: 0x00001036
	[CompilerGenerated]
	private void Start()
	{
		this.firstScript = base.GetComponent<PickUpController>();
	}

	// Token: 0x04000048 RID: 72
	public Transform player;

	// Token: 0x04000049 RID: 73
	public float pickUpRange;

	// Token: 0x0400004A RID: 74
	public static bool slotFull;

	// Token: 0x0400004B RID: 75
	public bool equipped;

	// Token: 0x0400004C RID: 76
	public PickUpController firstScript;
}
