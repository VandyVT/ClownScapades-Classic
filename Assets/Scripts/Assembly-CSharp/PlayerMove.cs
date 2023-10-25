using System;
using System.Collections;
using UnityEngine;

// Token: 0x0200002C RID: 44
public class PlayerMove : MonoBehaviour
{
	// Token: 0x060000B5 RID: 181 RVA: 0x000041F5 File Offset: 0x000023F5
	private void Awake()
	{
		this.charController = base.GetComponent<CharacterController>();
		//this.controls = new PlayerController();
	}

	// Token: 0x060000B6 RID: 182 RVA: 0x0000420E File Offset: 0x0000240E
	private void Update()
	{
		this.PlayerMovement();
		this.FlashKey();
	}

	// Token: 0x060000B7 RID: 183 RVA: 0x0000421C File Offset: 0x0000241C
	private void PlayerMovement()
	{
		float axis = Input.GetAxis(this.horizontalInputName);
		float axis2 = Input.GetAxis(this.verticalInputName);
		Vector3 a = base.transform.forward * axis2;
		Vector3 b = base.transform.right * axis;
		this.charController.SimpleMove(Vector3.ClampMagnitude(a + b, 1f) * this.movementSpeed);
		if ((axis2 != 0f || axis != 0f) && this.OnSlope())
		{
			this.charController.Move(Vector3.down * this.charController.height / 2f * this.slopeForce * Time.deltaTime);
		}
		this.SetMovementSpeed();
		this.JumpInput();
	}

	// Token: 0x060000B8 RID: 184 RVA: 0x000042F4 File Offset: 0x000024F4
	private void SetMovementSpeed()
	{
		if (Input.GetKey(this.runKey))
		{
			this.movementSpeed = Mathf.Lerp(this.movementSpeed, this.runSpeed, Time.deltaTime * this.runBuildUpSpeed);
		}
		if (Input.GetButton("Fire3"))
		{
			this.movementSpeed = Mathf.Lerp(this.movementSpeed, this.runSpeed, Time.deltaTime * this.runBuildUpSpeed);
			return;
		}
		this.movementSpeed = Mathf.Lerp(this.movementSpeed, this.walkSpeed, Time.deltaTime * this.runBuildUpSpeed);
	}

	// Token: 0x060000B9 RID: 185 RVA: 0x00004384 File Offset: 0x00002584
	private bool OnSlope()
	{
		RaycastHit raycastHit;
		return !this.isJumping && (Physics.Raycast(base.transform.position, Vector3.down, out raycastHit, this.charController.height / 2f * this.slopeForceRayLength) && raycastHit.normal != Vector3.up);
	}

	// Token: 0x060000BA RID: 186 RVA: 0x000043E2 File Offset: 0x000025E2
	private void JumpInput()
	{
		if (Input.GetKeyDown(this.jumpKey) && !this.isJumping)
		{
			this.isJumping = true;
			base.StartCoroutine(this.JumpEvent());
		}
	}

	// Token: 0x060000BB RID: 187 RVA: 0x0000440D File Offset: 0x0000260D
	private IEnumerator JumpEvent()
	{
		this.charController.slopeLimit = 90f;
		float timeInAir = 0f;
		do
		{
			float d = this.jumpFallOff.Evaluate(timeInAir);
			this.charController.Move(Vector3.up * d * this.jumpMultiplier * Time.deltaTime);
			timeInAir += Time.deltaTime;
			yield return null;
		}
		while (!this.charController.isGrounded && this.charController.collisionFlags != CollisionFlags.Above);
		this.charController.slopeLimit = 45f;
		this.isJumping = false;
		yield break;
	}

	// Token: 0x060000BC RID: 188 RVA: 0x0000441C File Offset: 0x0000261C
	private void FlashKey()
	{
		if (Input.GetKeyDown(KeyCode.F) && !this.flashlight.enabled)
		{
			this.flashlight.enabled = true;
			this.flashlightActive.SetActive(true);
			this.FSFX.Play();
		}
		else if (Input.GetKeyDown(KeyCode.F) && this.flashlight.enabled)
		{
			this.FSFX.Play();
			this.flashlight.enabled = false;
			this.flashlightActive.SetActive(false);
		}
		if (Input.GetButtonDown("FlashlightCon") && !this.flashlight.enabled)
		{
			this.flashlight.enabled = true;
			this.flashlightActive.SetActive(true);
			this.FSFX.Play();
			return;
		}
		if (Input.GetButtonDown("FlashlightCon") && this.flashlight.enabled)
		{
			this.FSFX.Play();
			this.flashlight.enabled = false;
			this.flashlightActive.SetActive(false);
		}
	}

	// Token: 0x040000A1 RID: 161
	public AudioSource FSFX;

	// Token: 0x040000A2 RID: 162
	[SerializeField]
	private string horizontalInputName;

	// Token: 0x040000A3 RID: 163
	[SerializeField]
	private string verticalInputName;

	// Token: 0x040000A4 RID: 164
	[SerializeField]
	private float walkSpeed;

	// Token: 0x040000A5 RID: 165
	[SerializeField]
	private float runSpeed;

	// Token: 0x040000A6 RID: 166
	[SerializeField]
	private float runBuildUpSpeed;

	// Token: 0x040000A7 RID: 167
	[SerializeField]
	private KeyCode runKey;

	// Token: 0x040000A8 RID: 168
	public float movementSpeed;

	// Token: 0x040000A9 RID: 169
	[SerializeField]
	private float slopeForce;

	// Token: 0x040000AA RID: 170
	[SerializeField]
	private float slopeForceRayLength;

	// Token: 0x040000AB RID: 171
	private CharacterController charController;

	// Token: 0x040000AC RID: 172
	[SerializeField]
	private AnimationCurve jumpFallOff;

	// Token: 0x040000AD RID: 173
	[SerializeField]
	private float jumpMultiplier;

	// Token: 0x040000AE RID: 174
	[SerializeField]
	private KeyCode jumpKey;

	// Token: 0x040000AF RID: 175
	//private PlayerController controls;

	// Token: 0x040000B0 RID: 176
	private bool isJumping;

	// Token: 0x040000B1 RID: 177
	public Light flashlight;

	// Token: 0x040000B2 RID: 178
	public GameObject flashlightActive;
}
